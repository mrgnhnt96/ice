// ignore_for_file: comment_references, implementation_imports

import 'package:enum_assist_annotation/enum_assist_annotation.dart';
import 'package:ice_annotation/src/ice.dart';
import 'package:ice_annotation/src/methods/methods.dart';

part 'annotation_types.ge.dart';

/// The different types of annotations that can be applied to a class
@EnumAssist()
enum AnnotationTypes {
  /// [Ice]
  @EnumValue(serializedValue: 'Ice')
  ice,

  /// [JsonSerializable]
  @EnumValue(serializedValue: 'JsonSerializable')
  jsonSerializable,

  /// [JsonKey]
  @EnumValue(serializedValue: 'JsonKey')
  jsonKey,

  /// [IceUnion]
  @EnumValue(serializedValue: 'IceUnion.create')
  unionBase,

  /// [IceUnion]
  @EnumValue(serializedValue: 'IceUnion.of')
  unionOf,

  /// [CopyWithConstructor]
  @EnumValue(serializedValue: 'CopyWith.constructor')
  copyWithConstructor,

  /// [Props]
  @EnumValue(serializedValue: 'props')
  props,

  /// [IgnoreProp]
  @EnumValue(serializedValue: 'ignoreProp')
  ignoreProp,

  /// [ToString]
  @EnumValue(serializedValue: 'toString')
  tostring,

  /// [CopyWith]
  @EnumValue(serializedValue: 'CopyWith.simple')
  copyWithSimple,

  /// [CopyWithTypeSafe]
  @EnumValue(serializedValue: 'CopyWith.typeSafe')
  copyWithTypeSafe,

  /// any other annotation
  other,
}

/// Annotations for [AnnotatinTypesX]
extension AnnotationTypesXX on AnnotationTypes {
  /// The [Ice] annotation
  bool get isIce => this == AnnotationTypes.ice;

  /// The [IceUnion] annotation
  bool get isUnionBase => this == AnnotationTypes.unionBase;

  /// The [JsonKey] annotation
  bool get isJsonKey => this == AnnotationTypes.jsonKey;

  /// The [IceUnion] annotation
  bool get isUnionOf => this == AnnotationTypes.unionOf;

  /// The [CopyWithConstructor] annotation
  bool get isCopyWithConstructor => this == AnnotationTypes.copyWithConstructor;

  /// The [Props] annotation
  bool get isProps => this == AnnotationTypes.props;

  /// The [IgnoreProp] annotation
  bool get isIgnoreProp => this == AnnotationTypes.ignoreProp;

  /// The [ToString] annotation
  bool get isToString => this == AnnotationTypes.tostring;

  /// The [CopyWith] annotation
  bool get isCopyWithSimple => this == AnnotationTypes.copyWithSimple;

  /// The [CopyWithTypeSafe] annotation
  bool get isCopyWithTypeSafe => this == AnnotationTypes.copyWithTypeSafe;

  /// any other annotation
  bool get isOther => this == AnnotationTypes.other;
}
