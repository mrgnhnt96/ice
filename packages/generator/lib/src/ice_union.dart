// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/templates.dart';
import 'package:ice/src/util/build_step_ext.dart';
import 'package:ice_annotation/src/ice.dart';
import 'package:source_gen/source_gen.dart';

/// {@template ice_generator}
/// A [Generator] that generates a [Ice] class for a given [ClassElement].
/// {@endtemplate}
class IceUnionGenerator extends GeneratorForAnnotation<IceUnion> {
  /// {@macro ice_generator}
  const IceUnionGenerator() : super();

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
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

    Class? union;
    final unionType = subject.annotations.ofUnionType;

    if (unionType != null && !subject.annotations.isUnionBase) {
      union = await buildStep.unionClass(unionType);
    }

    final iceTemplate = IceTemplate.forSubject(
      subject,
      union: union,
    );
    final unionTemplate = IceUnionBaseTemplate.forSubject(subject);

    final buffer = StringBuffer();

    iceTemplate.addToBuffer(buffer);
    if (subject.annotations.isUnionBase) {
      unionTemplate.addToBuffer(buffer);
    }

    return buffer.toString();
  }
}
