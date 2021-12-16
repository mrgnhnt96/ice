import 'package:ice_annotation/ice.dart';

/// {@template ice_settings}
/// A class that contains the settings from the build.yaml
/// {@endtemplate}
class IceSettings implements Ice {
  /// {@macro ice_settings}
  const IceSettings({
    this.copyWith = true,
    this.copyWithTypeSafe = true,
    this.equatable = true,
    this.tostring = true,
  });

  /// {@macro ice_settings}
  factory IceSettings.fromOptions(Map<String, dynamic> config) {
    return IceSettings(
      copyWith: config['copy_with'] as bool? ?? true,
      copyWithTypeSafe: config['copy_with_type_safe'] as bool? ?? true,
      equatable: config['equatable'] as bool? ?? true,
      tostring: config['tostring'] as bool? ?? true,
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
}
