import 'package:json_annotation/json_annotation.dart';

///
class IceJsonSerializable extends JsonSerializable {
  ///
  const IceJsonSerializable({
    bool? anyMap,
    bool? checked,
    bool? createFactory,
    bool? createToJson,
    bool? disallowUnrecognizedKeys,
    bool? explicitToJson,
    FieldRename? fieldRename,
    bool? ignoreUnannotated,
    bool? includeIfNull,
  }) : super(
          anyMap: anyMap,
          checked: checked,
          createFactory: createFactory,
          createToJson: createToJson,
          disallowUnrecognizedKeys: disallowUnrecognizedKeys,
          explicitToJson: explicitToJson,
          fieldRename: fieldRename,
          ignoreUnannotated: ignoreUnannotated,
          includeIfNull: includeIfNull,
        );

  /// converts all values to the json_serializable annotation
  String get asAnnotation {
    // ignore: deprecated_member_use
    final defaults = JsonSerializable.defaults;

    final allArgs = [
      if (createToJson != null && createToJson != defaults.createToJson)
        'createToJson: $createToJson',
      if (createFactory != null && createFactory != defaults.createFactory)
        'createFactory: $createFactory',
      if (explicitToJson != null && explicitToJson != defaults.explicitToJson)
        'explicitToJson: $explicitToJson',
      if (fieldRename != null && fieldRename != defaults.fieldRename)
        'fieldRename: $fieldRename',
      if (anyMap != null && anyMap != defaults.anyMap) 'anyMap: $anyMap',
      if (checked != null && checked != defaults.checked) 'checked: $checked',
      if (disallowUnrecognizedKeys != null &&
          disallowUnrecognizedKeys != defaults.disallowUnrecognizedKeys)
        'disallowUnrecognizedKeys: $disallowUnrecognizedKeys',
      if (ignoreUnannotated != null &&
          ignoreUnannotated != defaults.ignoreUnannotated)
        'ignoreUnannotated: $ignoreUnannotated',
      if (includeIfNull != null && includeIfNull != defaults.includeIfNull)
        'includeIfNull: $includeIfNull',
    ];

    var args = ',';

    if (allArgs.isNotEmpty) {
      args += '${allArgs.join(', ')},';
    }

    return "@JsonSerializable(constructor: '_'$args)";
  }
}
