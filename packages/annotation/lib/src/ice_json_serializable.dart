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

  /// whether there has been config provided to the json_serializable
  bool get hasNonDefaultValues {
    if (anyMap != null) return true;
    if (checked != null) return true;
    if (createFactory != null) return true;
    if (createToJson != null) return true;
    if (disallowUnrecognizedKeys != null) return true;
    if (explicitToJson != null) return true;
    if (fieldRename != null) return true;
    if (ignoreUnannotated != null) return true;
    if (includeIfNull != null) return true;
    return false;
  }
}
