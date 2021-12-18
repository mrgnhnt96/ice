// ignore_for_file: comment_references, avoid_dynamic_calls, no_default_cases
// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:ice/ice.dart';
import 'package:ice/src/domain/enums/copy_with_type_ext.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:ice/src/util/enum_ext.dart';
import 'package:ice_annotation/ice.dart';
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

  /// [props]
  final bool hasProps;

  /// [copyWith]
  final bool hasCopyWith;

  /// [toString]
  final bool hasToString;

  /// [copyWithType]
  final CopyWithType copyWithType;

  /// if the [type] can be generated
  bool canGenerateCopyWith(CopyWithType type) {
    return hasCopyWith && copyWithType == type;
  }

  /// All [AnnotationTypes] associated with [MethodAnnotations]
  static Set<AnnotationTypes> get annotationTypes => {
        AnnotationTypes.props,
        AnnotationTypes.copyWith,
        AnnotationTypes.copyWithTypeSafe,
        AnnotationTypes.tostring,
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
      case AnnotationTypes.props:
        return copyWith(hasProps: true);
      case AnnotationTypes.copyWith:
        return copyWith(hasCopyWith: true);
      case AnnotationTypes.copyWithTypeSafe:
        return copyWith(hasCopyWith: true, copyWithType: CopyWithType.typeSafe);
      case AnnotationTypes.tostring:
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
    required this.tostring,
    required this.ignoreGettersAsProps,
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
    final tostring = get<bool>('tostring') ?? iceSettings.tostring;
    final ignoreGettersAsProps =
        get<bool>('ignoreGettersAsProps') ?? iceSettings.ignoreGettersAsProps;
    final copyWithType = CopyWithType.values.fromReader(reader, 'copyWithType');

    return IceAnnotation(
      equatable: equatable,
      copyWith: copyWith,
      copyWithType: copyWithType ?? CopyWithType.simple,
      tostring: tostring,
      ignoreGettersAsProps: ignoreGettersAsProps,
    );
  }

  @override
  final bool copyWith;

  @override
  final CopyWithType copyWithType;

  @override
  final bool equatable;

  @override
  final bool tostring;

  @override
  final bool ignoreGettersAsProps;

  /// whether the [name] can be generated into code
  bool shouldGenerate(IceOptions option) {
    switch (option) {
      case IceOptions.copyWithSimple:
        if (!copyWith) {
          return false;
        }

        return copyWithType.isSimple;
      case IceOptions.copyWithFunction:
        if (!copyWith) {
          return false;
        }

        return copyWithType.isTypeSafe;
      case IceOptions.equatable:
        return equatable;
      case IceOptions.tostring:
        return tostring;
      case IceOptions.toJson:
      case IceOptions.other:
        return true;
    }
  }
}

/// The methods that will be generated with the [Ice] annotation
enum IceOptions {
  /// the simple copyWith will be generated
  copyWithSimple,

  /// the copyWith function will be generated
  copyWithFunction,

  /// [Equatable] will be generated
  equatable,

  /// toString will be generated
  tostring,

  /// toJson will be generated
  toJson,

  /// any other option
  other,
}
