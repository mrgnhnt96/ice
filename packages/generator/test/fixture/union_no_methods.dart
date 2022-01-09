import 'package:ice_annotation/ice.dart';

part 'fixtures/union_no_methods.dart';

@IceUnion.of(
  State,
  copyWith: CopyWith.none,
  equatable: false,
  jsonSerializable: null,
  toString: false,
)
class Example extends _$Example {
  const Example(
    this.name, {
    required this.code,
    required this.flag,
  });

  const Example.no()
      : this(
          '',
          code: 1,
          flag: true,
        );

  const Example.not(
    String name,
    int code,
    bool flag,
  )   : name = name,
        code = code,
        flag = flag;

  const Example.some(this.code)
      : name = '',
        flag = true;

  final String name;
  final int code;
  final bool flag;
}

@IceUnion.of(
  State,
  copyWith: CopyWith.none,
  equatable: false,
  jsonSerializable: null,
  toString: false,
)
class Other extends _$Other {}

@IceUnion.create(
  copyWith: CopyWith.none,
  equatable: false,
  jsonSerializable: null,
  toString: false,
)
class State extends _$State {
  const State();
}
