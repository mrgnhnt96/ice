// ignore_for_file: comment_references, lines_longer_than_80_chars

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:source_gen/source_gen.dart';

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
    required this.isTrueField,
  });

  /// retrieves the field from the [FieldElement]
  factory Field.fromElement(FieldElement element) {
    var includeInProps = true;

    var hasIgnoreProp = false;
    var hasJsonIgnore = false;

    final annotations = element.metadata;

    if (annotations.isNotEmpty) {
      for (final annotation in annotations) {
        final annotationName = annotation.element?.displayName;
        if (annotationName == null) {
          continue;
        }

        if (annotationName == AnnotationTypes.iceIgnoreProp.serialized) {
          hasIgnoreProp = true;
          continue;
        }

        if (annotationName == AnnotationTypes.jsonKey.serialized) {
          final reader = ConstantReader(annotation.computeConstantValue());
          hasJsonIgnore = reader.peek('ignore')?.boolValue ?? true;
          continue;
        }
      }
    }

    final type = element.type;
    final isTrueField = !element.isSynthetic;

    if (hasIgnoreProp || hasJsonIgnore) {
      includeInProps = false;
    }

    return Field(
      isNullable: type.nullabilitySuffix == NullabilitySuffix.question,
      name: element.displayName,
      type: type.getDisplayString(withNullability: true),
      isPrivate: element.isPrivate,
      includeInProps: includeInProps,
      isTrueField: isTrueField,
    );
  }

  /// retrieves the fields from the [FieldElement]s
  static List<Field> fromElements(
    List<FieldElement> elements, {
    required bool ignoreGettersAsProps,
  }) {
    final fields = <Field>[];

    for (final fieldElement in elements) {
      final field = Field.fromElement(fieldElement);

      if (!field.isTrueField && ignoreGettersAsProps) {
        continue;
      }

      fields.add(Field.fromElement(fieldElement));
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

  /// whether the field is a true field, not a getter
  ///
  /// getters are read as "synthetic" fields
  final bool isTrueField;
}
