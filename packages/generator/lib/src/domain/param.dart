// ignore_for_file: comment_references

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';

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

  /// Retreives the [Param] from the [ParameterElement]
  factory Param.fromElement(ParameterElement element) {
    final param = Param(
      name: element.displayName,
      type: element.type.getDisplayString(withNullability: true),
      isNullable: element.type.nullabilitySuffix == NullabilitySuffix.question,
    );

    return param;
  }

  /// The name of the [Param]
  final String name;

  /// The type of the [Param]
  final String type;

  /// Whether the [Param] is nullable
  final bool isNullable;
}
