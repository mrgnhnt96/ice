import 'package:ice_annotation/ice.dart';

part 'union.g.dart';
part 'fixtures/union.dart';
// part 'union.ice.dart';

@IceUnion.of(State)
class Example extends _$Example {
  const Example({
    required this.code,
    required this.flag,
    required this.name,
  });

  const Example.no() : this(name: '', code: 1, flag: true);

  const Example.not(
    String name,
    int code,
    bool flag,
  )   : code = code,
        name = name,
        flag = flag;

  const Example.some(this.code)
      : flag = true,
        name = '';

  final String name;
  final int code;
  final bool flag;
}

@IceUnion.of(State)
class Other extends _$Other {
  const Other();
}

@IceUnion.create()
class State extends _$State {
  const State();

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);
}
