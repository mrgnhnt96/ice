import 'package:enum_assist_annotation/enum_assist_annotation.dart';

part 'requiredness.ge.dart';

/// The different types required for a param
@EnumAssist()
enum Requiredness {
  /// `Example({required String name})`
  /// `Example(String name)`
  @EnumValue(readable: 'required')
  required,

  /// `Example({String? name})`
  /// `Example([String? name])`
  @EnumValue(readable: '')
  optional,
}
