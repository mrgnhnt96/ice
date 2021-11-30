// ignore_for_file: comment_references

/// {@template param}
/// A parameter of the [Class]
/// {@endtemplate}
class Param {
  /// {@macro param}
  Param({
    required this.name,
    required this.type,
    this.isNullable = false,
  });

  /// The name of the [Param]
  final String name;

  /// The type of the [Param]
  final String type;

  /// Whether the [Param] is nullable
  final bool isNullable;
}
