import 'package:enum_assist_annotation/enum_assist_annotation.dart';

part 'constructor_to_ignore.ge.dart';

/// Constructors that will be ignored by the generator
///
/// `other` is the only option that will be generated
@EnumAssist()
enum ConstructorToIgnore {
  /// a constructor named `fromJson`
  fromJson,

  /// any other constructor,
  ///
  /// this is the only option that will be generated
  other,
}

/// extension on [ConstructorToIgnore]
extension ConstructorToIgnoreXX on ConstructorToIgnore {
  /// if the constructor can be generated
  bool get canGenerate => this == ConstructorToIgnore.other;
}
