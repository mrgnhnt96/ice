// ignore_for_file: comment_references, implementation_imports

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/code_builder.dart';
import 'package:ice/src/domain/class.dart';
import 'package:ice/src/domain/ice_support.dart';
import 'package:ice_annotation/src/ice.dart';
import 'package:source_gen/source_gen.dart';

/// {@template ice_generator}
/// A [Generator] that generates a [Ice] class for a given [ClassElement].
/// {@endtemplate}
class IceGenerator extends Generator {
  /// {@macro ice_generator}
  const IceGenerator() : super();

  @override
  FutureOr<String?> generate(LibraryReader library, BuildStep buildStep) {
    final classes = iceClassesFrom(library);

    final buffer = StringBuffer();

    CodeBuilder(classes).generate(buffer);

    final support = IceSupport().get();
    buffer
      ..writeln()
      ..writeAll(support, '\n');

    return buffer.toString();
  }

  /// gets all the classes annottated with `(i|I)ce.*`
  Iterable<Class> iceClassesFrom(LibraryReader library) {
    final classes = library.classes;

    final iceClasses = <ClassElement>[];

    bool hasIceAnnotation(ElementAnnotation annotation) {
      final name = annotation.astName;

      return name.toLowerCase().startsWith('ice');
    }

    for (final subject in classes) {
      final annotations = subject.metadata;
      if (annotations.isEmpty) {
        continue;
      }

      if (annotations.firstWhereOrNull(hasIceAnnotation) != null) {
        iceClasses.add(subject);
      }
    }

    for (final subject in iceClasses) {
      Class.fromElement(subject);
    }

    return iceClasses.map(Class.fromElement);
  }
}

extension on ElementAnnotation {
  String get astName {
    return (this as ElementAnnotationImpl).annotationAst.name.name;
  }
}

extension on List {
  T? firstWhereOrNull<T>(bool Function(T) predicate) {
    for (final element in this) {
      if (predicate(element as T)) {
        return element;
      }
    }

    return null;
  }
}
