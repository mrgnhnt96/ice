import 'package:enum_assist_annotation/enum_assist_annotation.dart';

part 'method_to_ignore.ge.dart';

/// Methods that will be ignored by the generator
///
/// `other` is the only option that will be generated
@EnumAssist()
enum MethodsToIgnore {
  /// a method named toJson
  toJson,

  /// a method named string
  @EnumValue(serializedValue: 'toString')
  string,

  /// a method named props
  props,

  /// a method named copyWith
  copyWith,

  /// any other method
  ///
  /// `other` is the only option that will be generated
  other,
}
