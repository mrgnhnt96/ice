// ignore_for_file: comment_references, avoid_dynamic_calls, no_default_cases
// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:ice/ice.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:ice/src/util/enum_ext.dart';
import 'package:ice_annotation/ice.dart';
import 'package:json_serializable/builder.dart';
import 'package:source_gen/source_gen.dart';

/// {@template method_annotations}
/// The annotations used for methods to be generated when the [Ice]
/// annotation is not present.
/// {@endtemplate}
class MethodAnnotations {
  /// {@macro method_annotations}
  const MethodAnnotations({
    required this.hasProps,
    required this.hasCopyWith,
    required this.hasToString,
    required this.copyWithType,
  });

  /// {@macro method_annotations}
  const MethodAnnotations.empty()
      : this(
          hasProps: false,
          hasCopyWith: false,
          hasToString: false,
          copyWithType: CopyWithType.simple,
        );

  /// [iceProps]
  final bool hasProps;

  /// [copyWith]
  final bool hasCopyWith;

  /// [iceToString]
  final bool hasToString;

  /// [copyWithType]
  final CopyWithType copyWithType;

  /// if the [type] can be generated
  bool canGenerateCopyWith(CopyWithType type) {
    return hasCopyWith && copyWithType == type;
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
    bool? hasCopyWith,
    bool? hasToString,
    CopyWithType? copyWithType,
  }) {
    return MethodAnnotations(
      hasProps: hasProps ?? this.hasProps,
      hasCopyWith: hasCopyWith ?? this.hasCopyWith,
      hasToString: hasToString ?? this.hasToString,
      copyWithType: copyWithType ?? this.copyWithType,
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
      case AnnotationTypes.copyWithSimple:
        return copyWith(hasCopyWith: true);
      case AnnotationTypes.copyWithTypeSafe:
        return copyWith(hasCopyWith: true, copyWithType: CopyWithType.typeSafe);
      case AnnotationTypes.iceToString:
        return copyWith(hasToString: true);
      default:
        return this;
    }
  }
}

/// {@template ice_annotation}
/// The annotation details for [Ice]
/// {@endtemplate}
class IceAnnotation implements Ice {
  /// {@macro ice_annotation}
  const IceAnnotation({
    required this.copyWith,
    required this.copyWithType,
    required this.equatable,
    required this.iceToString,
    required this.ignoreGettersAsProps,
    required this.jsonSerializable,
  });

  /// gets the annotation from the [ElementAnnotation]
  static IceAnnotation? fromElement(ElementAnnotation annotation) {
    final element = annotation.element;

    if (element == null) {
      return null;
    }

    final reader = ConstantReader(annotation.computeConstantValue());

    T? get<T>(String name) {
      return reader.peek(name)?.literalValue as T?;
    }

    final copyWith = get<bool>('copyWith') ?? iceSettings.copyWith;
    final equatable = get<bool>('equatable') ?? iceSettings.equatable;
    final iceToString = get<bool>('iceToString') ?? iceSettings.iceToString;
    final ignoreGettersAsProps =
        get<bool>('ignoreGettersAsProps') ?? iceSettings.ignoreGettersAsProps;
    final copyWithType = CopyWithType.values.fromReader(reader, 'copyWithType');
    const jsonSerializable = JsonSerializable();

    return IceAnnotation(
      equatable: equatable,
      copyWith: copyWith,
      copyWithType: copyWithType ?? CopyWithType.simple,
      iceToString: iceToString,
      ignoreGettersAsProps: ignoreGettersAsProps,
      jsonSerializable: jsonSerializable,
    );
  }

  @override
  final bool? copyWith;

  @override
  final CopyWithType? copyWithType;

  @override
  final bool? equatable;

  @override
  final bool? iceToString;

  @override
  final bool? ignoreGettersAsProps;

  @override
  final JsonSerializable? jsonSerializable;
}

/// The methods that will be generated with the [Ice] annotation
enum IceOptions {
  /// the copyWith method will be generated
  copyWith,

  /// [Equatable] will be generated
  equatable,

  /// iceToString will be generated
  iceToString,

  /// toJson will be generated
  toJson,

  /// any other option
  other,
}
