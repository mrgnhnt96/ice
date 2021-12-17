// ignore_for_file: comment_references, implementation_imports, no_default_cases

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:source_gen/source_gen.dart';

/// {@template class_annotations}
/// The annotations specific to the Ice package
/// {@endtemplate}
class ClassAnnotations {
  /// {@macro class_annotations}
  const ClassAnnotations({
    required this.ice,
    required this.methods,
    required this.ofUnionType,
    required this.createToJson,
    required this.isUnionBase,
  });

  /// Retrieves the class annotations from the elements
  factory ClassAnnotations.fromElements(List<ElementAnnotation> elements) {
    IceAnnotation? ice;
    MethodAnnotations? methods;
    String? unionType;
    var createToJson = false;
    var isUnionBase = false;

    final types = {
      AnnotationTypes.jsonSerializable.serialized,
      AnnotationTypes.ice.serialized,
      AnnotationTypes.unionOf.serialized,
      AnnotationTypes.unionBase.serialized,
      ...MethodAnnotations.annotationTypes.map((e) => e.serialized),
    };

    const conv = AnnotationTypesConv.nullable;

    for (final annotation in elements) {
      final element = annotation.element;
      if (element == null) {
        continue;
      }

      final annotationType = types.lookup(element.displayName);
      if (annotationType == null) {
        continue;
      }

      final type = conv.fromJson(annotationType);
      switch (type) {
        case AnnotationTypes.ice:
          ice = IceAnnotation.fromElement(annotation);
          continue;
        case AnnotationTypes.unionOf:
          final reader = ConstantReader(annotation.computeConstantValue());
          // TODO(mrgnhnt96): make sure that the base type is right
          unionType = reader.peek('base')?.typeValue.toString();

          if (unionType?.endsWith('*') ?? false) {
            unionType = unionType!.substring(0, unionType.length - 1);
          }
          continue;
        case AnnotationTypes.unionBase:
          isUnionBase = true;
          continue;
        case AnnotationTypes.jsonSerializable:
          createToJson = true;
          continue;
        default:
          if (type == null) continue;
          if (ice != null) {
            if (methods != null) {
              // we do not want to create any methods if the class has been
              // annotated with [Ice]
              // ? throw an error?
              log.info(
                'This class has been annotated with '
                '[Ice] and ${type.serialized}',
              );

              methods = null;
            }
            continue;
          }

          methods = (methods ?? const MethodAnnotations.empty())
              .checkAnnotationAndUpdate(type);
      }
    }

    return ClassAnnotations(
      ice: ice,
      methods: methods,
      ofUnionType: unionType,
      createToJson: createToJson,
      isUnionBase: isUnionBase,
    );
  }

  /// the ice annotation
  final IceAnnotation? ice;

  /// the annotations for the methods to be generated
  final MethodAnnotations? methods;

  /// the union type
  final String? ofUnionType;

  /// whether the `toJson` method should be generated
  ///
  /// retrieved from the `JsonSerializable` annotation
  final bool createToJson;

  /// whether the class is the union base
  final bool isUnionBase;
}
