// ignore_for_file: overridden_fields, annotate_overrides

import 'package:ice_annotation/ice.dart';

part 'output/basic.dart';

@IceUnion.of(
  State,
  iceJsonSerializable: null,
)
class Example extends _$Example {
  Example(this.name);
  @iceJsonConstructor
  Example._() : name = '';

  final String name;
}

@IceUnion.of(
  State,
  iceJsonSerializable: null,
)
class Other extends _$Other {}

@IceUnion.of(
  State,
  iceJsonSerializable: null,
)
class Error extends _$Error {}

@IceUnion.create(
  iceJsonSerializable: null,
)
class State extends _$State {}

dynamic _$StateToJson(_$State state) => null;
Map<String, dynamic> _$ExampleToJson(_$State state) => <String, dynamic>{};
dynamic _$StateFromJson(Map<String, dynamic> json) => null;
