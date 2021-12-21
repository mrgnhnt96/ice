import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
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
    // TODO: implement generateForAnnotatedElement
    throw UnimplementedError();
  }
}
