// ignore_for_file: comment_references, implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:ice/src/domain/enums/enums.dart';

/// {@template method}
/// An existing method of the class annotated
/// {@endtemplate}
class Method {
  /// {@macro method}
  const Method({
    required this.name,
    required this.ignoreOption,
  });

  /// gets the method from the element
  factory Method.fromElement(MethodElement element) {
    return Method(
      name: element.name,
      ignoreOption:
          const MethodsToIgnoreConv(defaultValue: MethodsToIgnore.other)
              .fromJson(element.name),
    );
  }

  /// the name of the method
  final String name;

  /// whether the method should be ignored
  final MethodsToIgnore ignoreOption;

  /// gets a list of methods from elements
  static List<Method> fromElements(List<MethodElement> elements) {
    final methods = <Method>[];

    for (final element in elements) {
      final method = Method.fromElement(element);
      methods.add(method);
    }

    return methods;
  }
}
