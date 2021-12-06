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
  @EnumValue(serializedValue: 'Ice.createUnion')
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
