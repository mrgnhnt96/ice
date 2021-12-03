import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:copywith_annotation/copywith.dart';
import 'package:copywith_plus/src/domain/domain.dart';
import 'package:copywith_plus/src/templates/copy_with_template.dart';
import 'package:source_gen/source_gen.dart';

/// {@template copywith_generator}
/// A [Generator] that generates a [CopyWith] class for a given [ClassElement].
/// {@endtemplate}
class CopyWithGenerator extends GeneratorForAnnotation<CopyWith> {
  /// {@macro copywith_generator}
  const CopyWithGenerator() : super();

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    print(element);
    print(annotation);
    print(buildStep);

    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Generator cannot target `${element.runtimeType}`.',
        element: element,
      );
    }

    final subject = Class.fromElement(element);

    final copyWith = CopyWithTemplate.forSubject(subject);

    final result = copyWith.toString();

    return result;
  }
}
