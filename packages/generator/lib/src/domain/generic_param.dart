import 'package:analyzer/dart/element/element.dart';

///
class GenericParam {
  ///
  const GenericParam({
    required this.name,
    required this.declaration,
    required this.extendsType,
    required this.isPrimitive,
  });

  /// gets the generic param from [TypeParameterElement]
  factory GenericParam.fromElement(TypeParameterElement element) {
    final name = element.name;
    final declaration = '$element';
    final extendsType = element.bound?.getDisplayString(withNullability: true);

    bool isPrimitive() {
      final type = element.bound;

      if (type == null) {
        return false;
      }

      if (type.isDartCoreBool) return true;
      if (type.isDartCoreDouble) return true;
      if (type.isDartCoreInt) return true;
      if (type.isDartCoreNull) return true;
      if (type.isDartCoreNum) return true;
      if (type.isDartCoreString) return true;

      if (type.isDartCoreObject) return false;
      if (type.isDartCoreIterable) return false;
      // if (type.isDartCoreList) return false;
      // if (type.isDartCoreMap) return false;
      // if (type.isDartCoreSet) return false;

      return false;
    }

    return GenericParam(
      name: name,
      declaration: declaration,
      extendsType: extendsType,
      isPrimitive: isPrimitive(),
    );
  }

  /// the name of the generic parameter
  final String name;

  /// the declaration of the generic parameter
  final String declaration;

  /// the type that extends the generic parameter
  final String? extendsType;

  /// whether the generic parameter is a primitive parameter
  final bool isPrimitive;
}

/// ext on [Iterable<GenericParam>]
extension IterableGenericParamX on Iterable<GenericParam> {
  /// joins all declarations and wraps with <>
  ///
  /// e.g. <T, U extends Object>
  String get declaration {
    if (isEmpty) {
      return '';
    }

    final params = map((param) => param.declaration).join(', ');
    return '<$params>';
  }

  /// joins all names, and wraps with <>
  ///
  /// e.g. <T, U>
  String get args {
    if (isEmpty) {
      return '';
    }

    final params = map((param) => param.name).join(', ');
    return '<$params>';
  }
}
