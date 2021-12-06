// ignore_for_file: comment_references

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:ice/src/domain/enums/enums.dart';

/// {@template param}
/// A parameter of the [Class]
/// {@endtemplate}
class Param {
  /// {@macro param}
  Param({
    required this.name,
    required this.type,
    this.isNullable = false,
    required this.requiredness,
    required this.positionType,
  });

  /// Retreives the [Param] from the [ParameterElement]
  factory Param.fromElement(ParameterElement element) {
    final position =
        element.isNamed ? PositionType.named : PositionType.positioned;
    final requiredness =
        element.isNotOptional ? Requiredness.required : Requiredness.optional;

    final param = Param(
      name: element.displayName,
      type: element.type.getDisplayString(withNullability: true),
      isNullable: element.type.nullabilitySuffix == NullabilitySuffix.question,
      positionType: position,
      requiredness: requiredness,
    );

    return param;
  }

  /// Retreives the [Param]s from the [ParameterElement]s
  static List<Param> fromElements(List<ParameterElement> elements) {
    return elements.map((e) => Param.fromElement(e)).toList();
  }

  /// The name of the [Param]
  final String name;

  /// The type of the [Param]
  final String type;

  /// Whether the [Param] is nullable
  final bool isNullable;

  /// if the param is required
  final Requiredness requiredness;

  /// the position of the param
  final PositionType positionType;

  /// gets the type as a nullable type
  String get nullableType {
    if (isNullable) {
      return type;
    }

    return '$type?';
  }

  /// gets the type as a non-nullable type
  String get nonNullableType {
    if (isNullable) {
      return type.substring(0, type.length - 1);
    }

    return type;
  }

  /// formats the arg by [positionType]
  String get arg {
    return positionType.map(
      named: '$name: $name',
      positioned: name,
    );
  }
}
