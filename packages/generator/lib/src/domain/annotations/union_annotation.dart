// ignore_for_file: comment_references, avoid_dynamic_calls, no_default_cases
// ignore_for_file: implementation_imports, avoid_positional_boolean_parameters

import 'package:analyzer/dart/element/element.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:ice_annotation/ice.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';

///
class UnionAnnotation extends IceAnnotation implements IceUnion {
  ///
  const UnionAnnotation({
    bool? copyWith,
    CopyWithType? copyWithType,
    bool? equatable,
    bool? iceToString,
    bool? ignoreGettersAsProps,
    IceJsonSerializable? jsonSerializable,
    required this.isBase,
    required this.ofUnionType,
    required this.unionTypeId,
    required this.unionTypeKey,
  }) : super(
          copyWith: copyWith,
          copyWithType: copyWithType,
          equatable: equatable,
          iceToString: iceToString,
          ignoreGettersAsProps: ignoreGettersAsProps,
          jsonSerializable: jsonSerializable,
        );

  /// gets the props from the [annotation]
  static UnionAnnotation? fromElement(
    ElementAnnotation annotation,
    AnnotationTypes type,
  ) {
    final iceAnnotation = IceAnnotation.fromElement(annotation);

    if (iceAnnotation == null) {
      return null;
    }

    final isBase = type.isUnionBase;

    final reader = ConstantReader(annotation.computeConstantValue());

    String? unionType;
    if (type.isUnionOf) {
      unionType = reader.peek('base')?.typeValue.toString();

      if (unionType?.endsWith('*') ?? false) {
        unionType = unionType!.substring(0, unionType.length - 1);
      }
    }

    final unionTypeId = reader.peek('unionTypeId')?.stringValue;
    final unionTypeKey = reader.peek('unionTypeKey')?.stringValue;

    return UnionAnnotation(
      isBase: isBase,
      ofUnionType: unionType,
      unionTypeId: unionTypeId,
      unionTypeKey: unionTypeKey,
      copyWith: iceAnnotation.copyWith,
      copyWithType: iceAnnotation.copyWithType,
      equatable: iceAnnotation.equatable,
      iceToString: iceAnnotation.iceToString,
      ignoreGettersAsProps: iceAnnotation.ignoreGettersAsProps,
      jsonSerializable: iceAnnotation.jsonSerializable,
    );
  }

  /// whether the class is a base class of a union
  final bool isBase;

  /// if the class is sub class of a union, this is the
  /// name of the base union class
  final String? ofUnionType;

  @override
  final String? unionTypeId;

  @override
  final String? unionTypeKey;

  @override
  @internal
  Type get base => throw UnimplementedError();

  /// whether the class is a union
  bool get isSubUnion => ofUnionType != null;
}
