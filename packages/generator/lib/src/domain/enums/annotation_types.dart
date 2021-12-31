// ignore_for_file: comment_references, implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:ice/src/util/element_ext.dart';
import 'package:ice_annotation/src/ice.dart';

part 'annotation_types.ge.dart';

/// The different types of annotations that can be applied to a class
enum ClassAnnotationTypes {
  /// generates the ice class
  ice,

  /// config for json_serializable
  jsonSerializable,

  /// [IceUnion]
  unionCreate,

  /// [IceUnion]
  unionOf,

  /// does not create a class, only specific methods
  only,
}

/// annotations for constructors
enum CtorAnnotationTypes {
  /// the constructor to be used for the copyWith method
  copyWith,

  /// the constructor to be used for the fromJson factory
  fromJson,
}

/// annotations for fields
enum FieldAnnotationTypes {
  /// [JsonKey] from json_serializable
  jsonKey,

  /// ignores the field in the props getter
  ignoreProp,
}

/// ext on [ElementAnnotation] to check for the annotation type
extension ElementAnnotationListX on Iterable<ElementAnnotation> {
  /// check for the annotation type
  bool containsClassAnnotation(ClassAnnotationTypes type) {
    const conv = ClassAnnotationTypesConv.nullable;

    return any((e) {
      final name = e.astName;
      final result = conv.fromJson(name);

      return result != null;
    });
  }
}

/// Annotations for [AnnotatinTypesX]
extension AnnotationTypesXX on ClassAnnotationTypes {
  /// The [Ice] annotation
  bool get isIce => this == ClassAnnotationTypes.ice;

  /// The [IceUnion] annotation
  bool get isUnionBase => this == ClassAnnotationTypes.unionCreate;

  /// The [IceUnion] annotation
  bool get isUnionOf => this == ClassAnnotationTypes.unionOf;

  /// The [Props] annotation
  bool get isOnly => this == ClassAnnotationTypes.only;

  /// The [JsonSerializable] annotation
  bool get isJsonSerializable => this == ClassAnnotationTypes.jsonSerializable;
}
