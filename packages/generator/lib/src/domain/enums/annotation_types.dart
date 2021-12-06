// ignore_for_file: comment_references, implementation_imports

import 'package:enum_assist_annotation/enum_assist_annotation.dart';
import 'package:ice_annotation/src/ice.dart';

part 'annotation_types.ge.dart';

/// The different types of annotations that can be applied to a class
@EnumAssist()
enum AnnotationTypes {
  /// [Ice]
  @EnumValue(serializedValue: 'ice')
  ice,

  /// [IceUnionBase]
  @EnumValue(serializedValue: 'Ice.union')
  unionBase,

  /// [CopyWithEntryPoint]
  @EnumValue(serializedValue: 'copyWithEntryPoint')
  copyWithEntryPoint,

  @EnumValue(serializedValue: 'props')
  props,

  @EnumValue(serializedValue: 'toString')
  string,

  @EnumValue(serializedValue: 'copyWith')
  copyWith,

  /// any other annotation
  other,
}

/// extensions for annotationTypes
extension AnnotationTypesXX on AnnotationTypes {
  /// if the type is ice
  bool get isIce => this == AnnotationTypes.ice;

  /// if the type is unionBase
  bool get isUnion => this == AnnotationTypes.unionBase;

  /// if the type is copyWithEntryPoint
  bool get isEntryPoint => this == AnnotationTypes.copyWithEntryPoint;

  /// if the type is props
  bool get isProps => this == AnnotationTypes.props;

  /// if the type is string
  bool get isString => this == AnnotationTypes.string;

  /// if the type is copyWith
  bool get isCopyWith => this == AnnotationTypes.copyWith;

  /// if the type is other
  bool get isOther => this == AnnotationTypes.other;
}
