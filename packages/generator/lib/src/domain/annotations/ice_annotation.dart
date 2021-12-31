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
    required this.tostring,
    required this.ignoreGettersAsProps,
    required this.jsonSerializable,
    required this.props,
  });

  IceAnnotation._defaults()
      : this(
          copyWith: iceSettings.copyWith,
          equatable: iceSettings.equatable,
          tostring: iceSettings.tostring,
          ignoreGettersAsProps: iceSettings.ignoreGettersAsProps,
          jsonSerializable: iceSettings.jsonSerializable,
          props: iceSettings.props,
        );

  /// gets the annotation from the [ElementAnnotation]
  static IceAnnotation? fromElement(ElementAnnotation annotation) {
    final element = annotation.element;

    if (element == null) {
      return null;
    }

    final defaults = IceAnnotation._defaults();

    final reader = ConstantReader(annotation.computeConstantValue());

    T? get<T>(String name, [ConstantReader? _reader]) {
      return (_reader ?? reader).peek(name)?.literalValue as T?;
    }

    final props = get<bool>('props') ?? defaults.props;
    final equatable = get<bool>('equatable') ?? defaults.equatable;
    final tostring = get<bool?>('tostring') ?? defaults.tostring;
    final ignoreGettersAsProps =
        get<bool>('ignoreGettersAsProps') ?? defaults.ignoreGettersAsProps;
    final copyWithType =
        CopyWith.values.fromReader(reader, 'copyWith') ?? defaults.copyWith;
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
      copyWith: copyWithType,
      tostring: tostring,
      ignoreGettersAsProps: ignoreGettersAsProps,
      jsonSerializable: iceJsonSerializable,
      props: props,
    );
  }

  @override
  final CopyWith copyWith;

  @override
  final bool equatable;

  @override
  final bool tostring;

  @override
  final bool ignoreGettersAsProps;

  @override
  final IceJsonSerializable? jsonSerializable;

  @override
  final bool props;
}
