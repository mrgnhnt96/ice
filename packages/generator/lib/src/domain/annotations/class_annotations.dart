// ignore_for_file: comment_references, implementation_imports, no_default_cases

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/domain/annotations/annotations.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:ice/src/util/element_ext.dart';
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
    required this.isContainedUnion,
  }) : _ice = ice;

  /// Retrieves the class annotations from the elements
  factory ClassAnnotations.fromElements(List<ElementAnnotation> elements) {
    IceAnnotation? ice;
    MethodAnnotations? methods;
    UnionAnnotation? union;
    var isContainedUnion = false;

    void updateMethods(MethodAnnotations Function(MethodAnnotations) callback) {
      if (ice != null) {
        if (methods != null) {
          methods = null;
          // we do not want to create any methods if the class has been
          // annotated with [Ice]
          // ? throw an error?
          log.info(
            'This class has been annotated with '
            '[Ice] and a Method',
          );
        }
        return;
      }
      methods = callback(methods ??= MethodAnnotations.empty());
    }

    for (final annotation in elements) {
      final name = annotation.astName;
      const conv = ClassAnnotationTypesConv.nullable;
      final type = conv.fromJson(name);

      if (type == null) {
        continue;
      }

      switch (type) {
        case ClassAnnotationTypes.contained:
        case ClassAnnotationTypes.unionOf:
        case ClassAnnotationTypes.unionCreate:
          union = UnionAnnotation.fromElement(annotation, type);

          if (type.isContained) {
            isContainedUnion = true;
          }

          break;
        case ClassAnnotationTypes.ice:
          ice = IceAnnotation.fromElement(annotation);

          break;

        case ClassAnnotationTypes.jsonSerializable:
          updateMethods((methods) {
            final reader = ConstantReader(annotation.computeConstantValue());
            final createToJson = reader.peek('createToJson')?.boolValue;
            final createFromJson = reader.peek('createFactory')?.boolValue;

            return methods
                .copyWith(createToJson: createToJson)
                .copyWith(createFromJson: createFromJson);
          });

          break;

        case ClassAnnotationTypes.only:
          updateMethods((methods) {
            final onlyMethods = MethodAnnotations.fromElement(annotation);

            return methods.copyWith(
              copyWithType: onlyMethods.copyWithType,
              hasProps: onlyMethods.hasProps,
              hasToString: onlyMethods.hasToString,
            );
          });

          break;
      }
    }

    return ClassAnnotations(
      ice: ice,
      methods: methods,
      union: union,
      isContainedUnion: isContainedUnion,
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

  /// whether the union is annotated as contained
  final bool isContainedUnion;

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

  /// sets all properties to falsey values
  ///
  /// updates [union.unionId] to [className]
  ClassAnnotations unionFor(String className) {
    return ClassAnnotations(
      methods: null,
      isContainedUnion: false,
      ice: null,
      union: union?.forClass(className),
    );
  }
}
