// ignore_for_file: comment_references, implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/ice_subjects.dart';
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
  static IceSubjects unions = IceSubjects();

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
    unions.add(subject);

    final ice = IceTemplate.forSubject(subject);

    final result = ice.toString();

    return result;
  }
}
