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
    required this.isUnionBase,
  });

  /// Retrieves the class annotations from the elements
  factory ClassAnnotations.fromElements(List<ElementAnnotation> elements) {
    IceAnnotation? ice;
    MethodAnnotations? methods;
    String? unionType;
    var isUnionBase = false;

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
        case AnnotationTypes.ice:
        case AnnotationTypes.unionOf:
        case AnnotationTypes.unionCreate:
          ice = IceAnnotation.fromElement(annotation);

          if (type.isUnionOf) {
            final reader = ConstantReader(annotation.computeConstantValue());
            unionType = reader.peek('base')?.typeValue.toString();

            if (unionType?.endsWith('*') ?? false) {
              unionType = unionType!.substring(0, unionType.length - 1);
            }
          }

          if (type.isUnionBase) {
            isUnionBase = true;
          }

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

          methods ??= const MethodAnnotations.empty();

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
      ofUnionType: unionType,
      isUnionBase: isUnionBase,
    );
  }

  /// the ice annotation
  final IceAnnotation? ice;

  /// the annotations for the methods to be generated
  final MethodAnnotations? methods;

  /// the union type
  final String? ofUnionType;

  /// whether the class is the union base
  final bool isUnionBase;

  /// whether the class is a union
  bool get isUnionType => ofUnionType != null;

  /// if the class is annotated with [Ice] / [IceUnion]
  bool get isIceAnnotation => ice != null;

  /// if the class is annotated with [MethodAnnotation]
  bool get isMethodAnnotation => methods != null;
}
