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
    required this.tostring,
    required this.ignoreGettersAsProps,
  });

  /// the default settings for ice
  const IceSettings.defaultValues()
      : this(
          copyWith: true,
          copyWithType: CopyWithType.simple,
          equatable: true,
          tostring: true,
          ignoreGettersAsProps: true,
        );

  /// {@macro ice_settings}
  factory IceSettings.fromOptions(Map<String, dynamic> config) {
    const defaultValues = IceSettings.defaultValues();

    final conv = CopyWithTypeConv(defaultValue: defaultValues.copyWithType);
    final copyWithType = conv.fromJson(config['copy_with_type'] as String);

    return IceSettings(
      copyWith: config['copy_with'] as bool? ?? defaultValues.copyWith,
      copyWithType: copyWithType,
      equatable: config['equatable'] as bool? ?? defaultValues.equatable,
      tostring: config['to_string'] as bool? ?? defaultValues.tostring,
      ignoreGettersAsProps: config['ignore_getters_as_props'] as bool? ??
          defaultValues.ignoreGettersAsProps,
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
}
