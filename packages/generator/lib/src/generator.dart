// ignore_for_file: comment_references, implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/code_builder.dart';
import 'package:ice/src/domain/class.dart';
import 'package:ice/src/domain/ice_support.dart';
import 'package:ice/src/util/element_ext.dart';
import 'package:ice/src/util/iterable_ext.dart';
import 'package:ice/src/util/string_buffer_ext.dart';
import 'package:ice_annotation/src/ice.dart';
import 'package:source_gen/source_gen.dart';

/// {@template ice_generator}
/// A [Generator] that generates a [Ice] class for a given [ClassElement].
/// {@endtemplate}
class IceGenerator extends Generator {
  /// {@macro ice_generator}
  const IceGenerator() : super();

  @override
  String? generate(LibraryReader library, BuildStep buildStep) {
    final classes = iceClassesFrom(library);

    if (classes.isEmpty) {
      buildStep.reportUnusedAssets([buildStep.inputId]);
      return null;
    }

    final buffer = StringBuffer();

    CodeBuilder(classes).generate(buffer);

    final support = IceSupport().get();
    buffer.writeAll(support, pln);

    return buffer.toString();
  }

  /// checks for classes that have the [Ice] annotation
  Iterable<ClassElement> rawClassesFrom(LibraryReader library) {
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

    return iceClasses;
  }

  /// gets all the classes annottated with `(i|I)ce.*`
  Iterable<Class> iceClassesFrom(LibraryReader library) {
    final rawClasses = rawClassesFrom(library);

    final classes = rawClasses.map(Class.fromElement).toList();

    final containedUnions = <Class>[];

    for (var i = 0; i < classes.length; i++) {
      final subject = classes[i];

      if (!subject.annotations.isContainedUnion) {
        continue;
      }

      final unionClasses = expandContainedUnion(subject);
      classes.removeAt(i);
      containedUnions.addAll(unionClasses);
    }

    return [...classes, ...containedUnions];
  }

  /// expands a contained class into the base union class
  /// and its subClasses
  Iterable<Class> expandContainedUnion(Class subject) {
    final constructors =
        subject.constructors.where((ctor) => ctor.redirectName != null);

    final unions = constructors.map((c) => ContainedClass.subUnion(c, subject));

    final baseUnion = ContainedClass.union(subject);

    return [baseUnion, ...unions];
  }
}
