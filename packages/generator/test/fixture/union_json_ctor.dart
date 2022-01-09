import 'package:ice_annotation/ice.dart';

part 'union_json_ctor.g.dart';
part 'fixtures/union_json_ctor.dart';
// part 'union_json_ctor.ice.dart';

@IceUnion.of(State)
class Example extends _$Example {
  const Example(
    this.name, {
    required this.code,
    required this.flag,
  });

  @IceConstructor.fromJson
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

@IceUnion.of(State)
class Example2 extends _$Example2 {
  const Example2(
    this.name, {
    required this.code,
    required this.flag,
  });

  const Example2.no()
      : this(
          '',
          code: 1,
          flag: true,
        );

  @IceConstructor.fromJson
  const Example2.not(
    String name,
    int code,
    bool flag,
  )   : name = name,
        code = code,
        flag = flag;

  const Example2.some(this.code)
      : name = '',
        flag = true;

  final String name;
  final int code;
  final bool flag;
}

@IceUnion.of(State)
class Example3 extends _$Example3 {
  const Example3(
    this.name, {
    required this.code,
    required this.flag,
  });

  const Example3.named() : this('', code: 1, flag: true);

  const Example3.no()
      : this(
          '',
          code: 1,
          flag: true,
        );

  const Example3.not(
    String name,
    int code,
    bool flag,
  )   : name = name,
        code = code,
        flag = flag;

  @IceConstructor.fromJson
  const Example3.some(this.code)
      : name = '',
        flag = true;

  final String name;
  final int code;
  final bool flag;
}

@IceUnion.create()
class State extends _$State {
  const State();

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);
}
