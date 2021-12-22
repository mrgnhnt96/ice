import 'package:ice_annotation/ice.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main.ice.dart';
part 'main.g.dart';
// Ice Annotation:
// remove equatable on false

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
class Error extends _$Error {
  Error();
}

@IceUnion.create
class State extends _$State {}
