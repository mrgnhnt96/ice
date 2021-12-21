// ignore_for_file: comment_references, implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/ice_subjects.dart';
import 'package:ice/src/templates/ice_templates/ice_template.dart';
import 'package:ice/src/templates/templates.dart';
import 'package:ice/src/util/build_step_ext.dart';
import 'package:ice_annotation/src/ice.dart';
import 'package:source_gen/source_gen.dart';

/// {@template ice_generator}
/// A [Generator] that generates a [Ice] class for a given [ClassElement].
/// {@endtemplate}
class IceGenerator extends GeneratorForAnnotation<Ice> {
  /// {@macro ice_generator}
  const IceGenerator() : super();

  /// {@macro unions}
  static IceSubjects subjects = IceSubjects();

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
    subjects.add(subject);

    Class? union;
    final unionType = subject.annotations.ofUnionType;

    if (unionType != null && !subject.annotations.isUnionBase) {
      union = await buildStep.unionClass(unionType);
    }

    final iceTemplate = IceTemplate.forSubject(
      subject,
      union: union,
    );

    return iceTemplate.toString();
  }
}
