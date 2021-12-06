import 'package:enum_assist_annotation/enum_assist_annotation.dart';

part 'position_type.ge.dart';

/// The different types of params
@EnumAssist(createDescription: false)
enum PositionType {
  /// `Example({required String name})`
  /// `Example({String name = ''})`\
  /// `Example({String? name})`
  named,

  /// `Example([String? name])`\
  /// `Example([String name = ''])`\
  positioned,
}

/// extension for [PositionType]
extension PositionTypeXX on PositionType {
  /// if the type is named
  bool get isNamed => this == PositionType.named;

  /// if the type is positioned
  bool get isPositional => this == PositionType.positioned;
}
