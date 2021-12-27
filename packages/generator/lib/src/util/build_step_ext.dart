// ignore_for_file: parameter_assignments

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/domain/class.dart';
import 'package:source_gen/source_gen.dart';

/// ext on build step
extension BuildStepX on BuildStep {
  /// gets the current library
  Future<Class> unionClass(String name) async {
    if (name.endsWith('*')) {
      name = name.substring(0, name.length - 1);
    }

    final library = await inputLibrary;
    final libraryReader = LibraryReader(library);
    final result = libraryReader.findType(name);

    if (result == null) {
      throw 'Union type `$name` not found in library `${library.name}`.';
    }

    return Class.fromElement(result);
  }

  Future<Iterable<Class>> classesOf(TypeChecker typeChecker) async {
    final library = await inputLibrary;
    final reader = LibraryReader(library);

    final elements = reader.annotatedWith(typeChecker);
    final classes = <Class>[];

    for (final annotation in elements) {
      final element = annotation.element;
      if (element is! ClassElement) {
        continue;
      }

      classes.add(Class.fromElement(element));
    }

    return classes;
  }
}
