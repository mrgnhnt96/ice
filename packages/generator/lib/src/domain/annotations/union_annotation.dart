// ignore_for_file: comment_references, avoid_dynamic_calls, no_default_cases
// ignore_for_file: implementation_imports, avoid_positional_boolean_parameters

import 'package:analyzer/dart/element/element.dart';
import 'package:ice/ice.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:ice_annotation/ice.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';

///
class UnionAnnotation extends IceAnnotation implements IceUnion {
  ///
  const UnionAnnotation({
    IceJsonSerializable? jsonSerializable,
    required CopyWith copyWith,
    required bool equatable,
    required bool tostring,
    required bool ignoreGettersAsProps,
    required bool props,
    required this.isBase,
    required this.ofUnionType,
    required this.unionId,
    required this.unionKey,
  }) : super(
          copyWith: copyWith,
          equatable: equatable,
          tostring: tostring,
          ignoreGettersAsProps: ignoreGettersAsProps,
          jsonSerializable: jsonSerializable,
          props: props,
        );

  /// gets the props from the [annotation]
  static UnionAnnotation? fromElement(
    ElementAnnotation annotation,
    ClassAnnotationTypes type,
  ) {
    final iceAnnotation = IceAnnotation.fromElement(annotation);

    if (iceAnnotation == null) {
      return null;
    }

    /// if [type.isContained] is true, then the subject class is a union base
    /// this is because [element] is the annotation for the subject class
    final isBase = type.isUnionBase || type.isContained;

    final reader = ConstantReader(annotation.computeConstantValue());

    String? unionType;
    if (type.isUnionOf) {
      unionType = reader.peek('base')?.typeValue.toString();

      if (unionType?.endsWith('*') ?? false) {
        unionType = unionType!.substring(0, unionType.length - 1);
      }
    }

    final unionId = reader.peek('unionId')?.stringValue;
    final unionKey = reader.peek('unionKey')?.stringValue;

    return UnionAnnotation(
      isBase: isBase,
      ofUnionType: unionType,
      unionId: unionId,
      unionKey: unionKey ?? iceSettings.unionKey,
      copyWith: iceAnnotation.copyWith,
      equatable: iceAnnotation.equatable,
      tostring: iceAnnotation.tostring,
      ignoreGettersAsProps: iceAnnotation.ignoreGettersAsProps,
      jsonSerializable: iceAnnotation.jsonSerializable,
      props: iceAnnotation.props,
    );
  }

  /// whether the class is a base class of a union
  final bool isBase;

  /// if the class is sub class of a union, this is the
  /// name of the base union class
  final String? ofUnionType;

  @override
  final String? unionId;

  @override
  final String unionKey;

  @override
  @internal
  Type get base => throw UnimplementedError();

  /// whether the class is a union
  bool get isSubUnion => ofUnionType != null;

  /// changes the [unionId] to className
  UnionAnnotation forSubClass(String className, String unionType) {
    return UnionAnnotation(
      isBase: false,
      ofUnionType: unionType,
      unionId: className,
      unionKey: unionKey,
      copyWith: copyWith,
      equatable: equatable,
      tostring: tostring,
      ignoreGettersAsProps: ignoreGettersAsProps,
      jsonSerializable: jsonSerializable,
      props: props,
    );
  }
}
