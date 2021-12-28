import 'package:ice_annotation/ice.dart';

part 'main.ice.dart';
part 'main.g.dart';
// Ice Annotation:
// remove equatable on false

@IceUnion.of(
  State,
  copyWith: CopyWith.simple,
  unionTypeId: r'$Something',
)
class Example extends _$Example {
  const Example(this.name);

  final String name;
}

@IceUnion.of(State)
class Other extends _$Other {
  const Other(this.name);

  final String name;
}

@IceUnion.of(State)
class Error extends _$Error {
  const Error();
}

@IceUnion.create(
  unionTypeKey: 'runtimeType',
)
class State extends _$State {
  const State();

  factory State.example(String name) = Example;
}
