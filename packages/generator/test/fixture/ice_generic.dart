import 'package:ice_annotation/ice.dart';

part 'fixtures/ice_generic.dart';
// part 'ice_generic.ice.dart';
part 'ice_generic.g.dart';

@Ice()
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
