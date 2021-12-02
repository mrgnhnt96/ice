// ignore_for_file: comment_references

import 'package:analyzer/dart/element/element.dart';
import 'package:copywith_plus/src/domain/domain.dart';

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
  });

  /// Gets the constructor from the [ConstructorElement]
  factory Constructor.fromElement(ConstructorElement element) {
    final annotations = <Annotation>[];
    final params = <Param>[];

    for (final annotation in element.metadata) {
      final annotate = Annotation.fromElement(annotation);

      if (annotate == null) {
        continue;
      }

      annotations.add(annotate);
    }

    for (final param in element.parameters) {
      final paramElement = Param.fromElement(param);

      params.add(paramElement);
    }

    return Constructor(
      name: element.name,
      displayName: element.displayName,
      annotations: annotations,
      params: params,
    );
  }

  /// The name of the [Constructor]
  final String name;

  /// The name of the [Constructor] with the [Class]'s name
  final String displayName;

  /// The annotation of the [Constructor]
  final List<Annotation> annotations;

  /// The params of the [Constructor]
  final List<Param> params;

  /// Whether the [Constructor] is the copyWith entry point\
  /// determined by the [CopyWithEntryPoint] annotation
  bool get hasEntryPointAnnotation {
    return annotations.any((annotation) => annotation.isEntryPoint);
  }
}
