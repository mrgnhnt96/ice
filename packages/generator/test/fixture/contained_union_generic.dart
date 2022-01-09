import 'package:ice_annotation/ice.dart';

part 'fixtures/contained_union_generic.dart';
// part 'contained_union_generic.ice.dart';
part 'contained_union_generic.g.dart';

@IceUnion.contained()
class Example<T> extends _$Example<T> {
  const Example._();
  const factory Example.a(@TConv() T name) = A;
  const factory Example.b(String name) = B;
  const factory Example.c(String name, int code, bool flag) = C;
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
