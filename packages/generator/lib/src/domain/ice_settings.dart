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
    required this.unionKey,
    required this.formatOutput,
    required this.createFromJson,
    required this.createToJson,
    required this.props,
    required this.debugOutput,
  });

  /// the default settings for ice
  const IceSettings.defaultValues()
      : this(
          copyWith: CopyWith.nullSafe,
          equatable: true,
          tostring: true,
          ignoreGettersAsProps: true,
          unionKey: r'$unionType',
          formatOutput: false,
          createToJson: true,
          createFromJson: true,
          props: false,
          debugOutput: false,
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
      unionKey: config['union_type_key'] as String? ?? defaultValues.unionKey,
      tostring: config['to_string'] as bool? ?? defaultValues.tostring,
      ignoreGettersAsProps: config['ignore_getters_as_props'] as bool? ??
          defaultValues.ignoreGettersAsProps,
      formatOutput:
          config['format_output'] as bool? ?? defaultValues.formatOutput,
      debugOutput: config['_dev'] as bool? ?? defaultValues.formatOutput,
    );
  }

  @override
  final CopyWith copyWith;

  @override
  final bool equatable;

  @override
  final bool ignoreGettersAsProps;

  @override
  IceJsonSerializable? get jsonSerializable => generateJson
      ? IceJsonSerializable(
          createToJson: createToJson,
          createFactory: createFromJson,
        )
      : null;

  @override
  final bool props;

  @override
  final bool tostring;

  /// whether to create `toJson()`
  final bool createToJson;

  /// whether to create `fromJson()` & its constructors
  final bool createFromJson;

  /// whether to generate toJson and fromJson
  bool get generateJson => createToJson || createFromJson;

  /// the default key to be used for union serialization
  final String unionKey;

  /// whether to format the output of the generated code
  /// using the dartfmt tool
  final bool formatOutput;

  /// whether to debug the output without formatting
  ///
  /// This is useful for debugging the output of the generated code
  /// without having to run dartfmt on the generated code\
  /// Adds line breaks to code to make it easier to read
  final bool debugOutput;

  /// to debug build runner
  @visibleForTesting
  static Map<String, dynamic> debug({
    CopyWith? copyWith,
    bool? equatable,
    bool? tostring,
    bool? ignoreGettersAsProps,
    String? unionKey,
    bool? createFromJson,
    bool? createToJson,
    bool? props,
  }) {
    const defaults = IceSettings.defaultValues();

    return IceSettings(
      copyWith: copyWith ?? defaults.copyWith,
      equatable: equatable ?? defaults.equatable,
      tostring: tostring ?? defaults.tostring,
      ignoreGettersAsProps:
          ignoreGettersAsProps ?? defaults.ignoreGettersAsProps,
      unionKey: unionKey ?? defaults.unionKey,
      formatOutput: true,
      createFromJson: createFromJson ?? defaults.createFromJson,
      createToJson: createToJson ?? defaults.createToJson,
      props: props ?? defaults.props,
      debugOutput: true,
    )._toJson();
  }

  Map<String, dynamic> _toJson() {
    return <String, dynamic>{
      'copy_with': copyWith.name,
      'equatable': equatable,
      'ignore_getters_as_props': ignoreGettersAsProps,
      'props': props,
      'to_string': tostring,
      'create_to_json': createToJson,
      'create_from_json': createFromJson,
      'union_key': unionKey,
      'format_output': formatOutput,
      '_dev': debugOutput,
    };
  }
}
