import 'package:ice_annotation/ice.dart';

part 'fixtures/union_generic.dart';
// part 'fixtures/union_generic_bld_opt.dart';
// part 'union_generic.ice.dart';
part 'union_generic.g.dart';

@IceUnion.of(State)
class Example<T> extends _$Example<T> {
  const Example(
    this.name, {
    required this.code,
    required this.flag,
  });

  const Example.no()
      : this(
          '' as T,
          code: 1,
          flag: true,
        );

  const Example.not(
    String name,
    int code,
    bool flag,
  )   : name = name as T,
        code = code,
        flag = flag;

  const Example.some(this.code)
      : name = '' as T,
        flag = true;

  @TConv<T>()
  final T name;
  final int code;
  final bool flag;
}

class TConv<T> extends JsonConverter<T, String> {
  const TConv();

  @override
  T fromJson(String json) {
    return json as T;
  }

  @override
  String toJson(T object) {
    return '$object';
  }
}

@IceUnion.of(State)
class Other<T> extends _$Other<T> {
  const Other(this.some);
  @TConv<T>()
  final T some;
}

@IceUnion.create()
class State extends _$State {
  const State();

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);
}
