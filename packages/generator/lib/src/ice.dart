// ignore_for_file: comment_references, implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/templates.dart';
import 'package:ice_annotation/src/ice.dart';
import 'package:source_gen/source_gen.dart';

/// {@template ice_generator}
/// A [Generator] that generates a [Ice] class for a given [ClassElement].
/// {@endtemplate}
class IceGenerator extends GeneratorForAnnotation<Ice> {
  /// {@macro ice_generator}
  const IceGenerator() : super();

  /// {@macro unions}

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    // print(element);
    // print(annotation);
    // print(buildStep);

    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Generator cannot target `${element.runtimeType}`.',
        element: element,
      );
    }

    final subject = Class.fromElement(element);
    final unionType = subject.annotations.ofUnionType;

    Class? union;

    if (unionType != null && !subject.annotations.isUnionBase) {
      final library = await buildStep.resolver.libraryFor(buildStep.inputId);
      final libraryReader = LibraryReader(library);
      final result = libraryReader.findType(unionType);

      if (result == null) {
        throw 'Union type `$unionType` not found in library `${library.name}`.';
      }

      union = Class.fromElement(result);
    }

    final ice = IceTemplate.forSubject(
      subject,
      union: union,
    );

    final result = ice.toString();

    return result;
  }
}
