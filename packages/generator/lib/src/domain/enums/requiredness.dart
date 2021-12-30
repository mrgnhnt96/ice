import 'package:ice_annotation/ice.dart';

part 'requiredness.ge.dart';

/// The different types required for a param
enum Requiredness {
  /// `Example({required String name})`
  /// `Example(String name)`
  required,

  /// `Example({String? name})`
  /// `Example([String? name])`
  optional,
}

/// ext on requiredness
extension RequirednessXX on Requiredness {
  /// whether this is required
  bool get isRequired => this == Requiredness.required;

  /// whether this is optional
  bool get isOptional => this == Requiredness.optional;
}
