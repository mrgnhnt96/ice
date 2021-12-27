import 'package:ice/src/domain/enums/copy_with_type_ext.dart';
import 'package:ice_annotation/ice.dart';

/// {@template ice_settings}
/// A class that contains the settings from the build.yaml
/// {@endtemplate}
class IceSettings implements Ice {
  /// {@macro ice_settings}
  const IceSettings({
    required this.copyWith,
    required this.copyWithType,
    required this.equatable,
    required this.iceToString,
    required this.ignoreGettersAsProps,
    required this.iceJsonSerializable,
  });

  /// the default settings for ice
  const IceSettings.defaultValues()
      : this(
          copyWith: true,
          copyWithType: CopyWithType.simple,
          equatable: true,
          iceToString: true,
          ignoreGettersAsProps: true,
          iceJsonSerializable: const IceJsonSerializable(),
        );

  /// {@macro ice_settings}
  factory IceSettings.fromOptions(Map<String, dynamic> config) {
    const defaultValues = IceSettings.defaultValues();

    const conv = CopyWithTypeConv.nullable;
    final copyWithType = conv.fromJson(config['copy_with_type'] as String?) ??
        defaultValues.copyWithType;
    final iceJsonSerializable = JsonSerializable.fromJson(config).toIce();

    return IceSettings(
      copyWith: config['copy_with'] as bool? ?? defaultValues.copyWith,
      copyWithType: copyWithType,
      equatable: config['equatable'] as bool? ?? defaultValues.equatable,
      iceToString: config['to_string'] as bool? ?? defaultValues.iceToString,
      ignoreGettersAsProps: config['ignore_getters_as_props'] as bool? ??
          defaultValues.ignoreGettersAsProps,
      iceJsonSerializable: iceJsonSerializable,
    );
  }

  @override
  final bool copyWith;

  @override
  final CopyWithType copyWithType;

  @override
  final bool equatable;

  @override
  final bool iceToString;

  @override
  final bool ignoreGettersAsProps;

  @override
  final IceJsonSerializable? iceJsonSerializable;
}
