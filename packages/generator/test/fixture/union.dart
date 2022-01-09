import 'package:ice_annotation/ice.dart';

part 'union.g.dart';
part 'fixtures/union.dart';

@IceUnion.of(State)
class Example extends _$Example {
  const Example({
    required this.code,
    required this.flag,
  }) : super('example');

  const Example.no() : this(code: 1, flag: true);

  const Example.not(
    String name,
    int code,
    bool flag,
  )   : code = code,
        flag = flag,
        super(name);

  const Example.some(this.code)
      : flag = true,
        super('some');

  final int code;
  final bool flag;
}

@IceUnion.of(State)
class Other extends _$Other {
  const Other() : super('other');
}

@IceUnion.create()
class State extends _$State {
  const State(this.name);

  final String name;
}
