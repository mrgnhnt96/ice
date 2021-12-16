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
    required this.type,
    required this.isNullable,
    required this.isPrivate,
    required this.includeInProps,
  });

  /// retrieves the field from the [FieldElement]
  factory Field.fromElement(FieldElement element) {
    // TODO: get ignoreProp annotation
    const includeInProps = true;

    final type = element.type;

    return Field(
      isNullable: type.nullabilitySuffix == NullabilitySuffix.question,
      name: element.displayName,
      type: type.getDisplayString(withNullability: true),
      isPrivate: element.isPrivate,
      includeInProps: includeInProps,
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

  /// the type of the field
  final String type;

  /// if the field is nullable
  final bool isNullable;

  /// if the field is private
  final bool isPrivate;

  /// whether the field should be included
  /// in the `props` getter
  final bool includeInProps;
}
