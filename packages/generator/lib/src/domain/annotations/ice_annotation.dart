// ignore_for_file: comment_references, avoid_dynamic_calls, no_default_cases
// ignore_for_file: implementation_imports, avoid_positional_boolean_parameters

import 'package:analyzer/dart/element/element.dart';
import 'package:ice/ice.dart';
import 'package:ice/src/util/enum_ext.dart';
import 'package:ice_annotation/ice.dart';
import 'package:source_gen/source_gen.dart';

/// {@template ice_annotation}
/// The annotation details for [Ice]
/// {@endtemplate}
class IceAnnotation implements Ice {
  /// {@macro ice_annotation}
  const IceAnnotation({
    required this.copyWith,
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

    T? get<T>(String name, [ConstantReader? _reader]) {
      return (_reader ?? reader).peek(name)?.literalValue as T?;
    }

    final equatable = get<bool>('equatable') ?? iceSettings.equatable;
    final iceToString = get<bool>('iceToString') ?? iceSettings.iceToString;
    final ignoreGettersAsProps =
        get<bool>('ignoreGettersAsProps') ?? iceSettings.ignoreGettersAsProps;
    final copyWithType = CopyWith.values.fromReader(reader, 'copyWith');
    final iceJsonAnnotation = reader.peek('jsonSerializable')?.objectValue;

    IceJsonSerializable? iceJsonSerializable;

    if (iceJsonAnnotation != null) {
      final jsonReader = ConstantReader(iceJsonAnnotation);
      iceJsonSerializable = IceJsonSerializable(
        anyMap: get<bool?>('anyMap', jsonReader),
        checked: get<bool?>('checked', jsonReader),
        createFactory: get<bool?>('createFactory', jsonReader),
        createToJson: get<bool?>('createToJson', jsonReader),
        disallowUnrecognizedKeys:
            get<bool?>('disallowUnrecognizedKeys', jsonReader),
        explicitToJson: get<bool?>('explicitToJson', jsonReader),
        fieldRename: FieldRename.values.fromReader(jsonReader, 'fieldRename'),
        ignoreUnannotated: get<bool?>('ignoreUnannotated', jsonReader),
        includeIfNull: get<bool?>('includeIfNull', jsonReader),
      );
    }

    return IceAnnotation(
      equatable: equatable,
      copyWith: copyWithType ?? iceSettings.copyWith,
      iceToString: iceToString,
      ignoreGettersAsProps: ignoreGettersAsProps,
      jsonSerializable: iceJsonSerializable,
    );
  }

  @override
  final CopyWith copyWith;

  @override
  final bool equatable;

  @override
  final bool iceToString;

  @override
  final bool ignoreGettersAsProps;

  @override
  final IceJsonSerializable? jsonSerializable;
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

  /// fromJson will be generated
  fromJson,

  /// any other option
  wrapper,
}

///
extension IceOptionsX on IceOptions {
  ///
  bool get isCopyWith => this == IceOptions.copyWith;

  ///
  bool get isEquatable => this == IceOptions.equatable;

  ///
  bool get isIceToString => this == IceOptions.iceToString;

  ///
  bool get isToJson => this == IceOptions.toJson;

  ///
  bool get isFromJson => this == IceOptions.fromJson;

  ///
  bool get isWrapper => this == IceOptions.wrapper;
}
