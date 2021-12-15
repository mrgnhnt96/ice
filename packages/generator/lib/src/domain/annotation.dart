// ignore_for_file: comment_references, avoid_dynamic_calls
// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:ice/src/domain/enums/annotation_types.dart';
import 'package:ice_annotation/ice.dart';
import 'package:source_gen/source_gen.dart';

/// {@template annotation}
/// The annotation for a [Class]
/// {@endtemplate}
class Annotation {
  /// {@macro annotation}
  const Annotation({
    required this.name,
    required this.type,
    required this.declaration,
  });

  /// gets the annotation from the [ElementAnnotation]
  static Annotation? fromElement(ElementAnnotation annotation) {
    final element = annotation.element;

    if (element == null) {
      return null;
    }

    const annotationTypeConv =
        AnnotationTypesConv(defaultValue: AnnotationTypes.other);

    final name = element.displayName;
    final type = annotationTypeConv.fromJson(name);

    if (type.isIce) {
      return IceAnnotation.fromElement(annotation);
    }

    final declaration =
        '${(annotation as ElementAnnotationImpl).annotationAst}';

    return Annotation(
      name: name,
      type: type,
      declaration: declaration,
    );
  }

  /// gets the annotation from the [ElementAnnotation]s
  static List<Annotation> fromElements(List<ElementAnnotation> elements) {
    final annotations = <Annotation>[];

    for (final annotation in elements) {
      final annotate = Annotation.fromElement(annotation);
      if (annotate == null) {
        continue;
      }

      annotations.add(annotate);
    }

    return annotations;
  }

  /// The name of the annotation
  final String name;

  /// The type of the annotation
  final AnnotationTypes type;

  /// The declaration of the annotation
  ///
  /// eg:
  /// ```dart
  /// @JsonSerializable(fieldRename: FieldRename.snake)
  /// ```
  final String declaration;
}

/// {@template ice_annotation}
/// The annotation details for [Ice]
/// {@endtemplate}
class IceAnnotation extends Annotation implements Ice {
  /// {@macro ice_annotation}
  const IceAnnotation({
    required this.copyWith,
    required this.copyWithIsNullable,
    required this.equatable,
    required this.tostring,
    required String name,
    required AnnotationTypes type,
    required String declaration,
  }) : super(
          name: name,
          type: type,
          declaration: declaration,
        );

  /// gets the annotation from the [ElementAnnotation]
  static IceAnnotation? fromElement(ElementAnnotation annotation) {
    final element = annotation.element;

    if (element == null) {
      return null;
    }

    final name = element.displayName;

    final reader = ConstantReader(annotation.computeConstantValue());

    final copyWith = reader.read('copyWith').boolValue;
    final copyWithIsNullable = reader.read('copyWithIsNullable').boolValue;
    final equatable = reader.read('equatable').boolValue;
    final tostring = reader.read('tostring').boolValue;

    final declaration =
        '${(annotation as ElementAnnotationImpl).annotationAst}';

    return IceAnnotation(
      name: name,
      equatable: equatable,
      copyWith: copyWith,
      copyWithIsNullable: copyWithIsNullable,
      tostring: tostring,
      type: AnnotationTypes.ice,
      declaration: declaration,
    );
  }

  @override
  final bool copyWith;

  @override
  final bool copyWithIsNullable;

  @override
  final bool equatable;

  @override
  final bool tostring;

  /// whether the [name] can be generated into code
  bool shouldGenerate(IceOptions option) {
    switch (option) {
      case IceOptions.copyWith:
        return copyWith;
      case IceOptions.copyWithNullable:
        if (copyWith) {
          return false;
        }

        return copyWithIsNullable;
      case IceOptions.equatable:
        return equatable;
      case IceOptions.tostring:
        return tostring;
      case IceOptions.toJson:
        // TODO: implement toJson
        return true;
    }
  }
}

/// The methods that will be generated with the [Ice] annotation
enum IceOptions {
  /// [CopyWith] will be generated
  copyWith,

  /// [CopyWithNullable] will be generated
  copyWithNullable,

  /// [Equatable] will be generated
  equatable,

  /// [ToString] will be generated
  tostring,

  /// [ToJson] will be generated
  toJson,
}
