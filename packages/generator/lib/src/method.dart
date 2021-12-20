// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/templates.dart';
import 'package:ice_annotation/src/methods/methods.dart';
import 'package:source_gen/source_gen.dart';

/// {@template copywith_generator}
/// A [Generator] that generates a [CopyWith] class for a given [ClassElement].
/// {@endtemplate}
class MethodGenerator extends GeneratorForAnnotation<MethodAnnotation> {
  /// {@macro copywith_generator}
  const MethodGenerator() : super();

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
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

    final template = MethodTemplate.forSubject(subject);

    final result = template.toString();

    return result;
  }
}
