// ignore_for_file: comment_references

import 'package:analyzer/dart/element/element.dart';
import 'package:ice/src/domain/domain.dart';

/// {@template constructor}
/// A constructor of the [Class]
/// {@endtemplate}
class Constructor {
  /// {@macro constructor}
  const Constructor({
    required this.name,
    required this.displayName,
    required this.annotations,
    required this.params,
    required this.declaration,
    required this.isConst,
    required this.isPrivate,
  });

  /// Gets the constructor from the [ConstructorElement]
  factory Constructor.fromElement(ConstructorElement element) {
    final annotations = Annotation.fromElements(element.metadata);
    final params = Param.fromElements(element.parameters);

    final declaration = '${element.declaration}'
        .replaceAll(
          element.returnType.getDisplayString(withNullability: true),
          '',
        )
        .trim();

    return Constructor(
      name: element.name,
      displayName: element.displayName,
      annotations: annotations,
      params: params,
      declaration: declaration,
      isConst: element.isConst,
      isPrivate: element.isPrivate,
    );
  }

  /// Gets all constructors for the class from [ConstructorElement]
  static List<Constructor> fromElements(List<ConstructorElement> elements) {
    final constructors = <Constructor>[];

    for (final element in elements) {
      constructors.add(Constructor.fromElement(element));
    }

    return constructors;
  }

  /// The name of the constructor
  final String name;

  /// The name of the constructor with the [Class]'s name
  final String displayName;

  /// The annotation of the constructor
  final List<Annotation> annotations;

  /// The params of the constructor
  final List<Param> params;

  /// the domain of the constructor
  final String declaration;

  /// if the constructor is a const
  final bool isConst;

  /// If the constructor is named privately
  final bool isPrivate;

  /// Whether the constructor is the copyWith entry point\
  /// determined by the [CopyWithEntryPoint] annotation
  bool get hasEntryPointAnnotation {
    return annotations.any((annotation) => annotation.isEntryPoint);
  }

  /// if the constructor is the default constructor
  bool get isDefault => name.isEmpty;

  /// If the constructor is named
  bool get isNamed => !isDefault;

  /// If the constructor is underscore named
  bool get isNamedUnderscore => name == '_';
}
