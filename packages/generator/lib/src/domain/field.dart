// ignore_for_file: comment_references, lines_longer_than_80_chars, implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:ice/src/util/element_ext.dart';
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
    required this.jsonKeyDeclaration,
    required this.isGeneric,
    required this.annotations,
  });

  /// retrieves the field from the [FieldElement]
  factory Field.fromElement(FieldElement element) {
    var includeInProps = true;

    var hasIgnoreProp = false;
    var hasJsonIgnore = false;
    String? jsonKeyDeclaration;

    final annotations = element.metadata;
    final annotationDeclarations = <String>[];

    if (annotations.isNotEmpty) {
      for (final annotation in annotations) {
        annotationDeclarations.add('${annotation.ast}');

        final annotationName = annotation.element?.displayName;

        if (annotationName == FieldAnnotationTypes.ignoreProp.serialized) {
          hasIgnoreProp = true;

          continue;
        }

        if (annotationName == FieldAnnotationTypes.jsonKey.serialized) {
          jsonKeyDeclaration = annotation.ast.toString();
          final reader = ConstantReader(annotation.computeConstantValue());
          hasJsonIgnore = reader.peek('ignore')?.boolValue ?? true;

          continue;
        }
      }
    }

    final type = element.type;
    final isTrueField = !element.isSynthetic && !element.isStatic;
    final isGeneric = type is TypeParameterType;

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
      jsonKeyDeclaration: jsonKeyDeclaration,
      isGeneric: isGeneric,
      annotations: annotationDeclarations,
    );
  }

  /// creates a field from a [Param]
  factory Field.fromParam(Param param) {
    return Field(
      includeInProps: true,
      isNullable: param.isNullable,
      isPrivate: false,
      isTrueField: true,
      jsonKeyDeclaration: null,
      name: param.name,
      type: param.type,
      isGeneric: param.isGeneric,
      annotations: param.annotations,
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

  /// the declaration of [JsonKey] if it exists
  final String? jsonKeyDeclaration;

  /// where the field is type generic
  final bool isGeneric;

  /// the annotations for the field
  final Iterable<String> annotations;
}
