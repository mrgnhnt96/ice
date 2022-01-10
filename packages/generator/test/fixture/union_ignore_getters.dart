import 'package:ice_annotation/ice.dart';

part 'fixtures/union_ignore_getters.dart';
// part 'fixtures/union_ignore_getters_bld_opt.dart';
// part 'union_ignore_getters.ice.dart';
part 'union_ignore_getters.g.dart';

@IceUnion.of(
  State,
  ignoreGettersAsProps: false,
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

  String get other => 'other';
}

@IceUnion.of(State)
class Other extends _$Other {}

@IceUnion.create()
class State extends _$State {
  const State();
}
