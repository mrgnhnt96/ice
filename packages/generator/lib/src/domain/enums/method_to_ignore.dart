import 'package:ice_annotation/ice.dart';

part 'method_to_ignore.ge.dart';

/// Methods that will be ignored by the generator
///
/// `other` is the only option that will be generated
enum MethodsToIgnore {
  /// a method named toJson
  toJson,

  /// a method named string
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

/// extension on [MethodsToIgnore]
extension MethodsToIgnoreXX on MethodsToIgnore {
  /// returns true if the option is `other`
  bool get ignore => this != MethodsToIgnore.other;
}
