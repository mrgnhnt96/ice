// ignore_for_file: overridden_fields, annotate_overrides

import 'package:ice_annotation/ice.dart';

part 'output/basic.dart';

@Ice.only(copyWith: CopyWith.nullSafe)
class Example extends _$Example {
  Example(this.name);
  @IceConstructor.copyWith
  Example._() : name = '';

  final String name;
}

@IceUnion.of(
  State,
  jsonSerializable: null,
)
class Other extends _$Other {}

@IceUnion.of(
  State,
  jsonSerializable: IceJsonSerializable(),
)
class Error extends _$Error {}

@IceUnion.create(
  jsonSerializable: null,
)
class State extends _$State {}

dynamic _$StateToJson(_$State state) => null;
Map<String, dynamic> _$ExampleToJson(_$State state) => <String, dynamic>{};
dynamic _$StateFromJson(Map<String, dynamic> json) => null;
