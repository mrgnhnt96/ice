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
}
