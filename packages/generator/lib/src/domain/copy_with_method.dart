// ignore_for_file: comment_references

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:ice/src/domain/domain.dart';

/// {@template copy_with_method}
/// The copyWith method for a [Field]
/// {@endtemplate}
class CopyWithMethod {
  /// {@template copy_with_method}
  const CopyWithMethod({
    required this.returnType,
    required this.parameters,
  });

  /// retrieves the copyWith method from the [MethodElement]
  factory CopyWithMethod.fromElement(MethodElement element) {
    final parameters = Param.fromElements(element.parameters);
    final returnType =
        element.returnType.getDisplayString(withNullability: true);

    return CopyWithMethod(
      returnType: returnType,
      parameters: parameters,
    );
  }

  /// looks for the copyWith method in the field's methods
  static CopyWithMethod? fromElements(List<MethodElement> elements) {
    for (final element in elements) {
      if (element.name != 'copyWith') {
        continue;
      }

      final typeName =
          element.returnType.getDisplayString(withNullability: true);

      if (typeName.startsWith('_')) {
        break;
      }

      return CopyWithMethod.fromElement(element);
    }
  }

  /// checks all methods and superclasses methods for the copyWith method
  static CopyWithMethod? recursive(Element field) {
    dynamic type;

    if (field is FieldElement) {
      type = field.type;
    } else if (field is ParameterElement) {
      type = field.type;
    } else {
      return null;
    }

    if (type is! InterfaceType) {
      return null;
    }

    CopyWithMethod? checkSuper(InterfaceType? supe) {
      if (supe == null) {
        return null;
      }
      if (supe.methods.isEmpty) {
        if (supe.superclass == null) {
          return null;
        }

        return checkSuper(supe.superclass);
      }

      return CopyWithMethod.fromElements(supe.methods) ??
          checkSuper(supe.superclass);
    }

    if (type.methods.isEmpty) {
      return checkSuper(type.superclass);
    }

    return CopyWithMethod.fromElements(type.methods) ??
        checkSuper(type.superclass);
  }

  /// the name of the method
  String get name => 'copyWith';

  /// the return type of the method
  final String returnType;

  /// the params for the method
  final List<Param> parameters;
}
