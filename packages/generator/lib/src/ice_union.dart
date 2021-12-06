// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:ice/src/templates/templates.dart';
import 'package:ice_annotation/src/ice.dart';
import 'package:source_gen/source_gen.dart';

/// {@template ice_generator}
/// A [Generator] that generates a [Ice] class for a given [ClassElement].
/// {@endtemplate}
class IceUnionGenerator extends GeneratorForAnnotation<IceUnionBase> {
  /// {@macro ice_generator}
  const IceUnionGenerator() : super();

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    // print(IceGenerator.unions);
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

    final buffer = StringBuffer();

    IceTemplate? ice;

    if (subject.annotations.any((e) => e.type.isIce)) {
      ice = IceTemplate.forSubject(subject);
    }

    final union = IceUnionBaseTemplate.forSubject(subject);

    if (ice != null) {
      ice.addToBuffer(buffer);
    }

    union.addToBuffer(buffer, wrapInClass: ice == null);

    final result = buffer.toString();

    return result;
  }
}
