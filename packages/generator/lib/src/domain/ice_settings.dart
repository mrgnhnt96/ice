// ignore_for_file: overridden_fields

import 'package:ice/src/domain/enums/copy_with_type_ext.dart';
import 'package:ice_annotation/ice.dart';
import 'package:meta/meta.dart';

/// {@template ice_settings}
/// A class that contains the settings from the build.yaml
/// {@endtemplate}
class IceSettings implements Ice {
  /// {@macro ice_settings}
  const IceSettings({
    required this.copyWith,
    required this.equatable,
    required this.tostring,
    required this.ignoreGettersAsProps,
    required this.unionTypeKey,
    required this.formatOutput,
    required this.createFromJson,
    required this.createToJson,
    required this.props,
  });

  /// the default settings for ice
  const IceSettings.defaultValues()
      : this(
          copyWith: CopyWith.nullSafe,
          equatable: true,
          tostring: true,
          ignoreGettersAsProps: true,
          unionTypeKey: r'$unionType',
          formatOutput: false,
          createToJson: true,
          createFromJson: true,
          props: false,
        );

  /// {@macro ice_settings}
  factory IceSettings.fromOptions(Map<String, dynamic> config) {
    const defaultValues = IceSettings.defaultValues();

    const conv = CopyWithConv.nullable;
    final copyWithType =
        conv.fromJson(config['copy_with'] as String?) ?? defaultValues.copyWith;

    return IceSettings(
      copyWith: copyWithType,
      props: config['props'] as bool? ?? defaultValues.props,
      equatable: config['equatable'] as bool? ?? defaultValues.equatable,
      createToJson:
          config['create_to_json'] as bool? ?? defaultValues.createToJson,
      createFromJson:
          config['create_from_json'] as bool? ?? defaultValues.createFromJson,
      unionTypeKey:
          config['union_type_key'] as String? ?? defaultValues.unionTypeKey,
      tostring: config['to_string'] as bool? ?? defaultValues.tostring,
      ignoreGettersAsProps: config['ignore_getters_as_props'] as bool? ??
          defaultValues.ignoreGettersAsProps,
      formatOutput:
          config['format_output'] as bool? ?? defaultValues.formatOutput,
    );
  }

  /// whether to format the output
  static bool get debugOutput => _debugOutput;
  @visibleForTesting
  static set debugOutput(bool value) {
    _debugOutput = value;
    // ignore: avoid_print
    print(
      [
        '',
        '--- --- ---',
        '(TESTING) FORMATTING OUTPUT',
        '--- --- ---',
        '',
      ].join('\n'),
    );
  }

  static bool _debugOutput = false;

  @override
  final CopyWith copyWith;

  @override
  final bool equatable;

  @override
  final bool ignoreGettersAsProps;

  @override
  IceJsonSerializable? get jsonSerializable => null;

  @override
  final bool props;

  @override
  final bool tostring;

  /// whether to create `toJson()`
  final bool createToJson;

  /// whether to create `fromJson()` & its constructors
  final bool createFromJson;

  /// the default key to be used for union serialization
  final String unionTypeKey;

  /// whether to format the output of the generated code
  /// using the dartfmt tool
  final bool formatOutput;
}
