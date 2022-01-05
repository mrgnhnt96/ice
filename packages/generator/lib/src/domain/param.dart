// ignore_for_file: comment_references

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:ice/src/domain/copy_with_method.dart';
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
    required this.defaultValue,
    this.isNullable = false,
    required this.requiredness,
    required this.positionType,
    required this.isGeneric,
    required this.annotations,
    required this.copyWithMethod,
  });

  /// Retreives the [Param] from the [ParameterElement]
  factory Param.fromElement(ParameterElement element) {
    final position =
        element.isNamed ? PositionType.named : PositionType.positioned;
    final requiredness =
        element.isNotOptional ? Requiredness.required : Requiredness.optional;
    final isGeneric = element.type is TypeParameterType;
    final returnType = element.type.getDisplayString(withNullability: true);

    var defaultValue = element.defaultValueCode;
    final annotationDeclarations = <String>[];
    final annotations = element.metadata;

    bool isPrimitiveType(DartType? type) {
      if (type == null) {
        return false;
      }

      if (isGeneric) return false;

      if (type.isDartCoreBool) return true;
      if (type.isDartCoreDouble) return true;
      if (type.isDartCoreInt) return true;
      if (type.isDartCoreNull) return true;
      if (type.isDartCoreNum) return true;
      if (type.isDartCoreString) return true;

      if (type.isDartCoreObject) return false;
      if (type.isDartCoreIterable) return false;

      if (type.getDisplayString(withNullability: false) == 'Type') return true;
      //
      //
      // if (type.isDartCoreList) return true;
      // if (type.isDartCoreMap) return true;
      // if (type.isDartCoreSet) return true;

      return false;
    }

    for (final annotation in annotations) {
      if (annotation.astName != 'Default' || defaultValue != null) {
        annotationDeclarations.add('${annotation.ast}');
        continue;
      }

      final result = annotation.ast.arguments?.arguments.first;

      if (result == null) {
        continue;
      }

      var defaultResult = '$result';
      if (defaultResult == 'null') {
        continue;
      }

      final startsWithConst = defaultResult.startsWith('const ');

      if (!isPrimitiveType(result.staticType)) {
        if (isGeneric) {
          defaultValue = '$defaultResult as $returnType';
          continue;
        }

        if (!startsWithConst) {
          defaultValue = 'const $defaultResult';
          continue;
        }
      } else if (startsWithConst) {
        defaultResult = defaultResult.replaceFirst('const ', '');
      }

      defaultValue = defaultResult;
    }

    final name = element.displayName;
    final isNullable =
        element.type.nullabilitySuffix == NullabilitySuffix.question;

    final copyWithMethod = CopyWithMethod.recursive(element);

    return Param(
      name: name,
      type: returnType,
      isNullable: isNullable,
      positionType: position,
      requiredness: requiredness,
      defaultValue: defaultValue,
      isGeneric: isGeneric,
      annotations: annotationDeclarations,
      copyWithMethod: copyWithMethod,
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

  /// the default value
  final String? defaultValue;

  /// whether the param is generic
  final bool isGeneric;

  /// the annotations for the param
  final Iterable<String> annotations;

  /// the copyWith method for the param type
  final CopyWithMethod? copyWithMethod;

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
  ///
  /// [initialize] will format the params using `this.`
  Iterable<String> formatted({bool initialize = false}) sync* {
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
      var defaultValue = '';

      if (param.canHaveDefaultValue()) {
        defaultValue = ' = ${param.defaultValue}';
      } else if (param.defaultValue != null) {
        // TODO(mrgnhnt96): catch this error to prevent stopping the build
        throw 'There is a default value for ${param.name} '
            'but the param is not within `[]` or `{}`';
      }

      var prepend = '${param.type} ';
      if (initialize) {
        prepend = 'this.';
      }

      final formattedParam = '$prepend${param.name}$defaultValue';

      final openBracket = checkForBracket(
        param.positionType,
        param.requiredness,
      );

      var closing = '';

      if (isLast) {
        closing = ', ${closeBracket ?? ''}';
      }

      return '$openBracket' '$formattedParam' '$closing';
    }

    for (var i = 0; i < length; i++) {
      final param = elementAt(i);
      final isLast = i == length - 1;

      yield positionParam(param, isLast: isLast);
    }
  }
}

extension on Param {
  bool canHaveDefaultValue() {
    if (defaultValue == null) {
      return false;
    }

    return positionType.map(
      named: true,
      positioned: requiredness.isOptional,
    );
  }
}
