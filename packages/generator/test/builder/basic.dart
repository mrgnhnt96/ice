// ignore_for_file: overridden_fields, annotate_overrides

import 'package:enum_assist_annotation/enum_assist_annotation.dart';
import 'package:ice_annotation/ice.dart';

part 'output/basic.dart';

@Ice(
  copyWithType: CopyWithType.typeSafe,
)
@IceUnion.of(State)
@JsonSerializable()
class Example extends _$Example {
  Example(this.name);
  final String name;
}

@Ice()
@IceUnion.of(State)
class Other extends _$Other {}

@IceUnion.of(State)
class Error extends _$Error {}

@IceUnion.create
class State extends _$State {}

dynamic _$StateToJson(_$State state) => null;
Map<String, dynamic> _$ExampleToJson(_$State state) => <String, dynamic>{};
dynamic _$StateFromJson(Map<String, dynamic> json) => null;
