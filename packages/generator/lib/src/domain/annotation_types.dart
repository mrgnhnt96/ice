// ignore_for_file: comment_references, implementation_imports

import 'package:ice_annotation/src/ice.dart';
import 'package:ice_annotation/src/ice.dart';
import 'package:enum_assist_annotation/enum_assist_annotation.dart';

part 'annotation_types.ge.dart';

/// The different types of annotations that can be applied to a class
@EnumAssist()
enum AnnotationTypes {
  /// [Ice]
  @EnumValue(serializedValue: 'Ice')
  ice,

  /// [IceUnion]
  @EnumValue(serializedValue: 'Ice.union')
  union,

  /// [IceUnionBase]
  @EnumValue(serializedValue: 'IceUnionBase')
  unionBase,

  /// [CopyWithEntryPoint]
  @EnumValue(serializedValue: 'CopyWithEntryPoint')
  entryPoint,

  /// any other annotation
  other,
}
