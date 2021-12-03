// ignore_for_file: comment_references

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:ice/src/domain/domain.dart';

/// {@template field}
/// The [Field] of a [Class]
/// {@endtemplate}
class Field {
  /// {@template field}
  const Field({
    required this.name,
    required this.annotations,
    required this.type,
    required this.isNullable,
    required this.isPrivate,
  });

  /// retrieves the field from the [FieldElement]
  factory Field.fromElement(FieldElement element) {
    final annotations = Annotation.fromElements(element.metadata);

    return Field(
      annotations: annotations,
      isNullable: element.type.nullabilitySuffix == NullabilitySuffix.question,
      name: element.displayName,
      type: element.type.getDisplayString(withNullability: true),
      isPrivate: element.isPrivate,
    );
  }

  /// retrieves the fields from the [FieldElement]s
  static List<Field> fromElements(List<FieldElement> elements) {
    final fields = <Field>[];

    for (final field in elements) {
      fields.add(Field.fromElement(field));
    }

    return fields;
  }

  /// the name of the field
  final String name;

  /// the annotations for the field
  final List<Annotation> annotations;

  /// the type of the field
  final String type;

  /// if the field is nullable
  final bool isNullable;

  /// if the field is private
  final bool isPrivate;
}
