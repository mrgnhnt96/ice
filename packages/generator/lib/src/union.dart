import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/ice_support.dart';
import 'package:ice/src/ice.dart';
import 'package:ice/src/templates/union_mixin_template.dart';
import 'package:ice_annotation/ice.dart';
import 'package:source_gen/source_gen.dart';

/// {@template union_generator}
/// The generator for [IceUnion]
/// {@endtemplate}
class UnionGenerator extends GeneratorForAnnotation<IceUnion> {
  /// {@macro union_generator}
  const UnionGenerator();
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final unionType = annotation.peek('base')?.typeValue.toString();

    if (!(unionType?.startsWith('$IceUnion') ?? true)) {
      return '';
    }

    final subject = Class.fromElement(element as ClassElement);

    final subClasses = IceGenerator.subjects.getUnions(subject);

    final buffer = StringBuffer();
    final support = IceSupport().get();
    buffer.writeAll(support, '\n\n');

    UnionMixinTemplate.forSubject(subject, subClasses).addToBuffer(buffer);

    return buffer.toString();
  }
}
