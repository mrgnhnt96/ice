// ignore_for_file: comment_references, avoid_dynamic_calls, no_default_cases
// ignore_for_file: implementation_imports, avoid_positional_boolean_parameters

import 'package:ice/ice.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:ice_annotation/ice.dart';

/// {@template method_annotations}
/// The annotations used for methods to be generated when the [Ice]
/// annotation is not present.
/// {@endtemplate}
class MethodAnnotations {
  /// {@macro method_annotations}
  const MethodAnnotations({
    required this.hasProps,
    required this.hasToString,
    required this.copyWithType,
    this.createFromJson = false,
    this.createToJson = false,
  });

  /// {@macro method_annotations}
  MethodAnnotations.empty()
      : this(
          hasProps: false,
          hasToString: false,
          copyWithType: iceSettings.copyWith,
        );

  /// [iceProps]
  final bool hasProps;

  /// [iceToString]
  final bool hasToString;

  /// [copyWithType]
  final CopyWith copyWithType;

  /// whether the `toJson` method should be generated
  ///
  /// retrieved from the `JsonSerializable` annotation
  final bool createToJson;

  /// whether the `fromJson` function should be generated
  ///
  /// retrieved from the `JsonSerializable` annotation
  final bool createFromJson;

  /// updates [createToJson]
  MethodAnnotations updateToJson(bool value) {
    return copyWith(createToJson: value);
  }

  /// updates [createFromJson]
  MethodAnnotations updateFromJson(bool value) {
    return copyWith(createFromJson: value);
  }

  /// All [AnnotationTypes] associated with [MethodAnnotations]
  static Set<AnnotationTypes> get annotationTypes => {
        AnnotationTypes.iceProps,
        AnnotationTypes.copyWithSimple,
        AnnotationTypes.copyWithTypeSafe,
        AnnotationTypes.iceToString,
      };

  /// returns a copy of [MethodAnnotations]
  MethodAnnotations copyWith({
    bool? hasProps,
    bool? hasToString,
    CopyWith? copyWithType,
    bool? createToJson,
    bool? createFromJson,
  }) {
    return MethodAnnotations(
      hasProps: hasProps ?? this.hasProps,
      hasToString: hasToString ?? this.hasToString,
      copyWithType: copyWithType ?? this.copyWithType,
      createToJson: createToJson ?? this.createToJson,
      createFromJson: createFromJson ?? this.createFromJson,
    );
  }

  /// check the [type] for any [MethodAnnotations.annotationTypes]
  /// and updates [MethodAnnotations] using [copyWith]
  MethodAnnotations checkAnnotationAndUpdate(AnnotationTypes type) {
    if (!annotationTypes.contains(type)) {
      return this;
    }

    switch (type) {
      case AnnotationTypes.iceProps:
        return copyWith(hasProps: true);
      // TODO(mrgnhnt96): find a better way to support this
      case AnnotationTypes.copyWithSimple:
        return copyWith(copyWithType: CopyWith.typeSafe);
      case AnnotationTypes.copyWithTypeSafe:
        return copyWith(copyWithType: CopyWith.simple);
      case AnnotationTypes.iceToString:
        return copyWith(hasToString: true);
      default:
        return this;
    }
  }
}
