import 'package:ice_annotation/ice.dart';

part 'main.ice.dart';
part 'main.g.dart';
// Ice Annotation:
// remove equatable on false

@IceUnion.of(
  State,
  copyWithType: CopyWithType.typeSafe,
)
class Example extends _$Example {
  Example(this.name);

  final String name;

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);
}

@IceUnion.of(State)
class Other extends _$Other {}

@IceUnion.of(State)
class Error extends _$Error {
  Error();
}

@IceUnion.create()
class State extends _$State {}
