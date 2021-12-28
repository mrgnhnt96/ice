// ignore_for_file: comment_references, implementation_imports, no_default_cases

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/domain/annotations/annotations.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:source_gen/source_gen.dart';

/// {@template class_annotations}
/// The annotations specific to the Ice package
/// {@endtemplate}
class ClassAnnotations {
  /// {@macro class_annotations}
  const ClassAnnotations({
    required IceAnnotation? ice,
    required this.methods,
    required this.union,
  }) : _ice = ice;

  /// Retrieves the class annotations from the elements
  factory ClassAnnotations.fromElements(List<ElementAnnotation> elements) {
    IceAnnotation? ice;
    MethodAnnotations? methods;
    UnionAnnotation? union;

    final types = {
      AnnotationTypes.jsonSerializable.serialized,
      AnnotationTypes.ice.serialized,
      AnnotationTypes.unionOf.serialized,
      AnnotationTypes.unionCreate.serialized,
      ...MethodAnnotations.annotationTypes.map((e) => e.serialized),
    };

    for (final annotation in elements) {
      final type = types.getAnnotationFrom(annotation);
      if (type == null) {
        continue;
      }

      switch (type) {
        case AnnotationTypes.unionOf:
        case AnnotationTypes.unionCreate:
          union = UnionAnnotation.fromElement(annotation, type);
          continue;
        case AnnotationTypes.ice:
          ice = IceAnnotation.fromElement(annotation);

          continue;

        case AnnotationTypes.other:
          continue;

        // handle method & json annotations
        case AnnotationTypes.jsonSerializable:
        default:
          if (ice != null && methods != null) {
            methods = null;
            // we do not want to create any methods if the class has been
            // annotated with [Ice]
            // ? throw an error?
            log.info(
              'This class has been annotated with '
              '[Ice] and ${type.serialized}',
            );

            continue;
          }

          methods ??= MethodAnnotations.empty();

          if (type.isJsonSerializable) {
            final reader = ConstantReader(annotation.computeConstantValue());
            final createToJson = reader.peek('createToJson')?.boolValue;
            final createFromJson = reader.peek('createFactory')?.boolValue;

            methods = methods
              ..updateToJson(createToJson ?? true)
              ..updateFromJson(createFromJson ?? true);
          } else {
            methods = methods.checkAnnotationAndUpdate(type);
          }
      }
    }

    return ClassAnnotations(
      ice: ice,
      methods: methods,
      union: union,
    );
  }

  /// the ice annotation
  final IceAnnotation? _ice;

  /// gets the ice annotation from [Ice] or [IceUnion]
  IceAnnotation? get ice => _ice ?? union;

  /// the annotations for the methods to be generated
  final MethodAnnotations? methods;

  /// the union annotation
  final UnionAnnotation? union;

  /// if the class is annotated with [Ice] / [IceUnion]
  bool get isIceAnnotation => ice != null;

  /// if the class is annotated with [IceUnion]
  bool get isUnionAnnotation => union != null;

  /// if the class is annotated with [MethodAnnotation]
  bool get isMethodAnnotation => methods != null;

  /// check if class is the union base
  bool get isUnionBase => union?.isBase ?? false;

  /// check if class is a sub union
  bool get isSubUnion => union?.isSubUnion ?? false;
}
