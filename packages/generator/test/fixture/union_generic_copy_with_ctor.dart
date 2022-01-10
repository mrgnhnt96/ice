import 'package:ice_annotation/ice.dart';

part 'fixtures/union_generic_copy_with_ctor.dart';
// part 'fixtures/union_generic_copy_with_ctor_bld_opt.dart';
// part 'union_generic_copy_with_ctor.ice.dart';
part 'union_generic_copy_with_ctor.g.dart';

@IceUnion.of(State)
class Example<T> extends _$Example<T> {
  const Example(
    this.name, {
    required this.code,
    required this.flag,
  });

  @IceConstructor.copyWith
  const Example.named(
    String name, {
    required this.code,
    required this.flag,
  }) : name = name as T;

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
class Example2<T> extends _$Example2<T> {
  const Example2(
    this.name, {
    required this.code,
    required this.flag,
  });

  @IceConstructor.copyWith
  const Example2.named(
    String name, {
    required this.code,
    required this.flag,
  }) : name = name as T;

  const Example2.no()
      : this(
          '' as T,
          code: 1,
          flag: true,
        );

  const Example2.not(
    String name,
    int code,
    bool flag,
  )   : name = name as T,
        code = code,
        flag = flag;

  const Example2.some(this.code)
      : name = '' as T,
        flag = true;

  @TConv<T>()
  final T name;
  final int code;
  final bool flag;
}

@IceUnion.of(State)
class Example3<T> extends _$Example3<T> {
  const Example3(
    this.name, {
    required this.code,
    required this.flag,
  });

  @IceConstructor.copyWith
  const Example3.named(
    String name, {
    required this.code,
    required this.flag,
  }) : name = name as T;

  const Example3.no()
      : this(
          '' as T,
          code: 1,
          flag: true,
        );

  const Example3.not(
    String name,
    int code,
    bool flag,
  )   : name = name as T,
        code = code,
        flag = flag;

  const Example3.some(this.code)
      : name = '' as T,
        flag = true;

  @TConv<T>()
  final T name;
  final int code;
  final bool flag;
}

@IceUnion.create()
class State extends _$State {
  const State();
}
