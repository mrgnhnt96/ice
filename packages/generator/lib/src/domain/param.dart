// ignore_for_file: comment_references

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:ice/src/util/element_ext.dart';

/// {@template param}
/// A parameter of the [Class]
/// {@endtemplate}
class Param {
  /// {@macro param}
  Param({
    required this.name,
    required this.type,
    required String? defaultValue,
    this.isNullable = false,
    required this.requiredness,
    required this.positionType,
    required bool defaultRequiresConstKeyword,
  })  : _defaultRequiresConstKeyword = defaultRequiresConstKeyword,
        _defaultValue = defaultValue;

  /// Retreives the [Param] from the [ParameterElement]
  factory Param.fromElement(ParameterElement element) {
    final position =
        element.isNamed ? PositionType.named : PositionType.positioned;
    final requiredness =
        element.isNotOptional ? Requiredness.required : Requiredness.optional;

    String? getDefaultValue() {
      if (element.defaultValueCode != null) {
        return element.defaultValueCode;
      }

      final annotations = element.metadata;

      if (annotations.isEmpty) {
        return null;
      }

      for (final annotation in annotations) {
        if (annotation.astName != 'Default') {
          continue;
        }

        final result = annotation.ast.arguments?.arguments.first;

        if (result == null) {
          continue;
        }

        final defaultValue = '$result';
        if (defaultValue == 'null') {
          return null;
        }

        return defaultValue;
      }
    }

    bool isDartCoreType() {
      final type = element.type;

      if (type.isDartCoreBool) return false;
      if (type.isDartCoreDouble) return false;
      if (type.isDartCoreInt) return false;
      if (type.isDartCoreNull) return false;
      if (type.isDartCoreNum) return false;
      if (type.isDartCoreObject) return true;
      if (type.isDartCoreString) return false;

      if (type.isDartCoreIterable) return true;
      // if (type.isDartCoreList) return true;
      // if (type.isDartCoreMap) return true;
      // if (type.isDartCoreSet) return true;

      return true;
    }

    final defaultValue = getDefaultValue();
    final name = element.displayName;
    final type = element.type.getDisplayString(withNullability: true);
    final isNullable =
        element.type.nullabilitySuffix == NullabilitySuffix.question;

    final bool defaultRequiresConstKeyword;
    if (defaultValue == null) {
      defaultRequiresConstKeyword = false;
    } else {
      defaultRequiresConstKeyword = isDartCoreType();
    }

    return Param(
      name: name,
      type: type,
      isNullable: isNullable,
      positionType: position,
      requiredness: requiredness,
      defaultValue: defaultValue,
      defaultRequiresConstKeyword: defaultRequiresConstKeyword,
    );
  }

  /// Retreives the [Param]s from the [ParameterElement]s
  static List<Param> fromElements(List<ParameterElement> elements) {
    return elements.map(Param.fromElement).toList();
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

  final String? _defaultValue;

  /// the default value
  String? get defaultValue {
    if (_defaultRequiresConstKeyword && _defaultValue != null) {
      return 'const $_defaultValue';
    }
    return _defaultValue;
  }

  /// this is true for all non primitive types
  /// for default values
  final bool _defaultRequiresConstKeyword;

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

/// extension for Param
extension ParamListX on Iterable<Param> {
  /// formats the params as bracket inserted, positioned params
  Iterable<String> formatted() sync* {
    String? closeBracket;

    String setUpBrackets(PositionType type) {
      if (closeBracket != null) {
        // brackets already set
        return '';
      }

      var open = '';

      type.map(
        named: () {
          open = '{';
          closeBracket = '}';
        },
        positioned: () {
          open = '[';
          closeBracket = ']';
        },
      )();

      return open;
    }

    String checkForBracket(
      PositionType position,
      Requiredness requiredness,
    ) {
      if (position.isPositional && requiredness.isOptional) {
        final bracket = setUpBrackets(position);

        return bracket;
      }

      if (position.isNamed) {
        final bracket = setUpBrackets(position);

        return bracket;
      }

      return '';
    }

    String positionParam(Param param, {bool isLast = false}) {
      final paramWithType = '${param.type} ${param.name}';

      if (isLast) {
        return '$paramWithType, ${closeBracket ?? ''}';
      }

      final openBracket = checkForBracket(
        param.positionType,
        param.requiredness,
      );

      return '$openBracket' '$paramWithType';
    }

    for (var i = 0; i < length; i++) {
      final param = elementAt(i);
      final isLast = i == length - 1;

      yield positionParam(param, isLast: isLast);
    }
  }
}
