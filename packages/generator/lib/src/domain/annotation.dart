// ignore_for_file: comment_references, avoid_dynamic_calls
// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:ice/src/domain/enums/annotation_types.dart';
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
    required this.genAsPrivate,
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

    final reader = ConstantReader(annotation.computeConstantValue());
    final genAsPrivate = reader.peek('isPrivate')?.boolValue ?? false;

    final declaration =
        '${(annotation as ElementAnnotationImpl).annotationAst}';

    return Annotation(
      name: name,
      type: type,
      declaration: declaration,
      genAsPrivate: genAsPrivate,
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

  /// whether the generated class should be private
  final bool genAsPrivate;
}
