// ignore_for_file: comment_references

import 'package:analyzer/dart/element/element.dart';
import 'package:copywith_annotation/copywith.dart';

/// {@template annotation}
/// The annotation for a [Class]
/// {@endtemplate}
class Annotation {
  /// {@macro annotation}
  const Annotation(this.name);

  /// gets the annotation from the [ElementAnnotation]
  static Annotation? fromElement(ElementAnnotation annotation) {
    final name = annotation.element?.displayName;

    if (name == null) {
      return null;
    }

    return Annotation(name);
  }

  /// The name of the [Annotation]
  final String name;

  /// Whether the [Annotation] is the entry point for [CopyWith]
  bool get isEntryPoint => name == '$CopyWithEntryPoint';
}
