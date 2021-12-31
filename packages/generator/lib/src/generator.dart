// ignore_for_file: comment_references, implementation_imports

import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/code_builder.dart';
import 'package:ice/src/domain/class.dart';
import 'package:ice/src/domain/ice_support.dart';
import 'package:ice/src/util/iterable_ext.dart';
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

    final assets = <AssetId>{};

    for (final import in library.element.imports) {
      final importedLibrary = import.importedLibrary;
      var uri = importedLibrary?.identifier;
      if (importedLibrary == null || uri == null) {
        continue;
      }

      final importReader = LibraryReader(importedLibrary);
      final classes = rawClassesFrom(importReader);

      if (classes.isNotEmpty) {
        continue;
      }

      uri = uri.replaceFirst('package:', '');

      // possible dart import
      if (uri.contains(':')) {
        continue;
      }
      final separator = Platform.pathSeparator;
      uri = uri.replaceFirst(separator, '|lib$separator');

      final asset = AssetId.parse(uri);
      assets.add(asset);
    }

    buildStep.reportUnusedAssets(assets);

    CodeBuilder(classes).generate(buffer);

    final support = IceSupport().get();
    buffer.writeAll(support);

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
    final classes = rawClassesFrom(library);

    return classes.map(Class.fromElement);
  }
}

extension on ElementAnnotation {
  String get astName {
    return (this as ElementAnnotationImpl).annotationAst.name.name;
  }
}
