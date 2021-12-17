import 'package:ice/src/domain/enums/copy_with_type_ext.dart';
import 'package:ice_annotation/ice.dart';

/// {@template ice_settings}
/// A class that contains the settings from the build.yaml
/// {@endtemplate}
class IceSettings implements Ice {
  /// {@macro ice_settings}
  const IceSettings({
    this.copyWith = true,
    this.copyWithType = CopyWithType.simple,
    this.equatable = true,
    this.tostring = true,
  });

  /// {@macro ice_settings}
  factory IceSettings.fromOptions(Map<String, dynamic> config) {
    const conv = CopyWithTypeConv(defaultValue: CopyWithType.simple);
    final copyWithType = conv.fromJson(config['copy_with_type'] as String);

    return IceSettings(
      copyWith: config['copy_with'] as bool? ?? true,
      copyWithType: copyWithType,
      equatable: config['equatable'] as bool? ?? true,
      tostring: config['tostring'] as bool? ?? true,
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
}
