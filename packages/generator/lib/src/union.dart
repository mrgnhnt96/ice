import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/domain/ice_support.dart';
import 'package:ice/src/templates/union_template.dart';
import 'package:ice/src/util/build_step_ext.dart';
import 'package:ice_annotation/ice.dart';
import 'package:source_gen/source_gen.dart';

/// {@template union_generator}
/// The generator for [IceUnion]
/// {@endtemplate}
class UnionGenerator extends GeneratorForAnnotation<IceUnion> {
  /// {@macro union_generator}
  const UnionGenerator();
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final unionType = annotation.peek('base')?.typeValue.toString();

    if (!(unionType?.startsWith('$IceUnion') ?? true)) {
      return '';
    }

    final subClasses = (await buildStep.classesOf(typeChecker)).toList();
    final subjectIndex = subClasses.indexWhere((e) => e.name == element.name);
    final subject = subClasses[subjectIndex];
    subClasses.removeAt(subjectIndex);

    final buffer = StringBuffer();

    UnionTemplate.forSubject(subject, subClasses).addToBuffer(buffer);

    final support = IceSupport().get();
    buffer
      ..writeln()
      ..writeAll(support, '\n');

    return buffer.toString();
  }
}
