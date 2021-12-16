// ignore_for_file: comment_references, avoid_dynamic_calls
// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:ice/ice.dart';
import 'package:ice_annotation/ice.dart';
import 'package:source_gen/source_gen.dart';

class MethodAnnotations {
  const MethodAnnotations(
      {required this.hasProps,
      required this.hasCopyWith,
      required this.hasToString});

  final bool hasProps;
  final bool hasCopyWith;
  final bool hasToString;
}

/// {@template ice_annotation}
/// The annotation details for [Ice]
/// {@endtemplate}
class IceAnnotation implements Ice {
  /// {@macro ice_annotation}
  const IceAnnotation({
    required this.copyWith,
    required this.copyWithTypeSafe,
    required this.equatable,
    required this.tostring,
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
    final copyWithTypeSafe =
        get<bool>('copyWithTypeSafe') ?? iceSettings.copyWithTypeSafe;
    final equatable = get<bool>('equatable') ?? iceSettings.equatable;
    final tostring = get<bool>('tostring') ?? iceSettings.tostring;

    return IceAnnotation(
      equatable: equatable,
      copyWith: copyWith,
      copyWithTypeSafe: copyWithTypeSafe,
      tostring: tostring,
    );
  }

  @override
  final bool copyWith;

  @override
  final bool copyWithTypeSafe;

  @override
  final bool equatable;

  @override
  final bool tostring;

  /// whether the [name] can be generated into code
  bool shouldGenerate(IceOptions option) {
    switch (option) {
      case IceOptions.copyWith:
        return copyWith;
      case IceOptions.copyWithTypeSafe:
        if (copyWith) {
          return false;
        }

        return copyWithTypeSafe;
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
  /// [CopyWith] will be generated
  copyWith,

  /// [CopyWithNullable] will be generated
  copyWithTypeSafe,

  /// [Equatable] will be generated
  equatable,

  /// [ToString] will be generated
  tostring,

  /// [toJson] will be generated
  toJson,

  /// any other option
  other,
}
