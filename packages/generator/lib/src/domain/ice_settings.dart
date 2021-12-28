// ignore_for_file: overridden_fields

import 'package:ice/src/domain/enums/copy_with_type_ext.dart';
import 'package:ice_annotation/ice.dart';

/// {@template ice_settings}
/// A class that contains the settings from the build.yaml
/// {@endtemplate}
class IceSettings implements Ice {
  /// {@macro ice_settings}
  const IceSettings({
    required this.copyWith,
    required this.equatable,
    required this.iceToString,
    required this.ignoreGettersAsProps,
    required this.jsonSerializable,
    required this.unionTypeKey,
  });

  /// the default settings for ice
  const IceSettings.defaultValues()
      : this(
          copyWith: CopyWith.simple,
          equatable: true,
          iceToString: true,
          ignoreGettersAsProps: true,
          jsonSerializable: const SettingJsonSerializable._default(),
          unionTypeKey: r'$unionType',
        );

  /// {@macro ice_settings}
  factory IceSettings.fromOptions(Map<String, dynamic> config) {
    const defaultValues = IceSettings.defaultValues();

    const conv = CopyWithTypeConv.nullable;
    final copyWithType =
        conv.fromJson(config['copy_with'] as String?) ?? defaultValues.copyWith;
    final iceJsonSerializable = JsonSerializable.fromJson(config).toIce();

    return IceSettings(
      copyWith: copyWithType,
      equatable: config['equatable'] as bool? ?? defaultValues.equatable,
      unionTypeKey:
          config['union_type_key'] as String? ?? defaultValues.unionTypeKey,
      iceToString: config['to_string'] as bool? ?? defaultValues.iceToString,
      ignoreGettersAsProps: config['ignore_getters_as_props'] as bool? ??
          defaultValues.ignoreGettersAsProps,
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
  final SettingJsonSerializable jsonSerializable;

  /// the default key to be used for union serialization
  final String unionTypeKey;
}

///
class SettingJsonSerializable extends IceJsonSerializable {
  ///
  const SettingJsonSerializable({
    required this.anyMap,
    required this.checked,
    required this.createFactory,
    required this.createToJson,
    required this.disallowUnrecognizedKeys,
    required this.explicitToJson,
    required this.fieldRename,
    required this.ignoreUnannotated,
    required this.includeIfNull,
  });

  const SettingJsonSerializable._default()
      : this(
          anyMap: true,
          checked: true,
          createFactory: true,
          createToJson: true,
          disallowUnrecognizedKeys: true,
          explicitToJson: true,
          fieldRename: FieldRename.none,
          ignoreUnannotated: true,
          includeIfNull: true,
        );

  @override
  final bool anyMap;

  @override
  final bool checked;

  @override
  final bool createFactory;

  @override
  final bool createToJson;

  @override
  final bool disallowUnrecognizedKeys;

  @override
  final bool explicitToJson;

  @override
  final FieldRename fieldRename;

  @override
  final bool ignoreUnannotated;

  @override
  final bool includeIfNull;
}

///
extension on JsonSerializable {
  ///
  SettingJsonSerializable toIce() {
    // ignore: deprecated_member_use
    const defaults = SettingJsonSerializable._default();

    return SettingJsonSerializable(
      anyMap: anyMap ?? defaults.anyMap,
      checked: checked ?? defaults.checked,
      createFactory: createFactory ?? defaults.createFactory,
      createToJson: createToJson ?? defaults.createToJson,
      disallowUnrecognizedKeys:
          disallowUnrecognizedKeys ?? defaults.disallowUnrecognizedKeys,
      explicitToJson: explicitToJson ?? defaults.explicitToJson,
      fieldRename: fieldRename ?? defaults.fieldRename,
      ignoreUnannotated: ignoreUnannotated ?? defaults.ignoreUnannotated,
      includeIfNull: includeIfNull ?? defaults.includeIfNull,
    );
  }
}
