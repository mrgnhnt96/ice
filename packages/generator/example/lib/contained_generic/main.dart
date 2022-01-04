import 'package:ice_annotation/ice.dart';

part 'main.ice.dart';
part 'main.g.dart';

@IceUnion.contained()
class Example<T, R extends Object> extends _$Example<T, R> {
  const Example._();

  const factory Example.a({@Default('hello world') @TConv() String name}) = _A;
  const factory Example.b([@Default(5) int code]) = _B;
  const factory Example.c([@Default(<String>[]) dynamic value]) = _C;

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);
}

@Ice()
class MyClass extends _$MyClass {
  const MyClass();

  factory MyClass.fromJson(Map<String, dynamic> json) =>
      _$MyClassFromJson(json);
}

class TConv extends JsonConverter<Object, String> {
  const TConv();

  @override
  Object fromJson(String json) {
    return json;
  }

  @override
  String toJson(Object object) {
    return '$object';
  }
}
