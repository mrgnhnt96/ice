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
    required this.createFromJson,
    required this.isUnionBase,
  });

  /// Retrieves the class annotations from the elements
  factory ClassAnnotations.fromElements(List<ElementAnnotation> elements) {
    IceAnnotation? ice;
    MethodAnnotations? methods;
    String? unionType;
    var createToJson = false;
    var createFromJson = false;
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

      void checkForJson([ConstantReader? reader]) {
        if (reader == null) {
          final annotationReader =
              ConstantReader(annotation.computeConstantValue());

          final iceJsonAnnotation =
              annotationReader.peek('iceJsonSerializable')?.objectValue;

          if (iceJsonAnnotation != null) {
            return checkForJson(ConstantReader(iceJsonAnnotation));
          }
          return;
        }

        createToJson = reader.peek('createToJson')?.boolValue ?? true;
        createFromJson = reader.peek('createFactory')?.boolValue ?? true;
      }

      switch (type) {
        case AnnotationTypes.ice:
          ice = IceAnnotation.fromElement(annotation);
          checkForJson();

          continue;
        case AnnotationTypes.unionOf:
          final reader = ConstantReader(annotation.computeConstantValue());
          unionType = reader.peek('base')?.typeValue.toString();

          if (unionType?.endsWith('*') ?? false) {
            unionType = unionType!.substring(0, unionType.length - 1);
          }

          ice = IceAnnotation.fromElement(annotation);

          final iceJsonAnnotation =
              reader.peek('iceJsonSerializable')?.objectValue;
          if (iceJsonAnnotation != null) {
            checkForJson(ConstantReader(iceJsonAnnotation));
          }

          continue;
        case AnnotationTypes.unionCreate:
          isUnionBase = true;

          continue;
        case AnnotationTypes.jsonSerializable:
          checkForJson(ConstantReader(annotation.computeConstantValue()));

          continue;
        default:
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
      createFromJson: createFromJson,
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

  /// whether the `fromJson` function should be generated
  ///
  /// retrieved from the `JsonSerializable` annotation
  final bool createFromJson;

  /// whether the class is the union base
  final bool isUnionBase;

  /// whether the class is a union
  bool get isUnionType => ofUnionType != null;
}
