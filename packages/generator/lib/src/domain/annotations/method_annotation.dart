// ignore_for_file: comment_references, avoid_dynamic_calls, no_default_cases
// ignore_for_file: implementation_imports, avoid_positional_boolean_parameters

import 'package:analyzer/dart/element/element.dart';
import 'package:ice/ice.dart';
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
    required this.hasToString,
    required this.copyWithType,
    this.createFromJson = false,
    this.createToJson = false,
  });

  /// {@macro method_annotations}
  MethodAnnotations.empty()
      : this(
          hasProps: iceSettings.props,
          hasToString: iceSettings.tostring,
          copyWithType: iceSettings.copyWith,
        );

  /// gets the methods that should be generated from the annotation
  factory MethodAnnotations.fromElement(ElementAnnotation element) {
    final reader = ConstantReader(element.computeConstantValue());

    final props = reader.peek('props')?.boolValue;
    final tostring = reader.peek('tostring')?.boolValue;
    final copyWith = CopyWith.values.fromReader(reader, 'copyWith');

    return MethodAnnotations.empty().copyWith(
      hasProps: props,
      copyWithType: copyWith,
      hasToString: tostring,
    );
  }

  /// if the class has the props annotation
  final bool hasProps;

  /// if the class has the toString annotation
  final bool hasToString;

  /// if the class has the copyWith annotation
  final CopyWith copyWithType;

  /// whether the `toJson` method should be generated
  ///
  /// retrieved from the `JsonSerializable` annotation
  final bool createToJson;

  /// whether the `fromJson` function should be generated
  ///
  /// retrieved from the `JsonSerializable` annotation
  final bool createFromJson;

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
}
