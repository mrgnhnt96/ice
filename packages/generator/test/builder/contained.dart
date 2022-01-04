import 'package:ice_annotation/ice.dart';

part 'output/contained.dart';

@IceUnion.contained()
class Example<T, R extends Object> extends _$Example<T, R> {
  const Example._();

  const factory Example.a({@Default('hello world') T name}) = _A;
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

dynamic _$StateToJson(dynamic state) => null;
Map<String, dynamic> _$ExampleToJson(dynamic state) => <String, dynamic>{};
Example<T, R> _$ExampleFromJson<T, R extends Object>(
  Map<String, dynamic> json,
) =>
    const Example.b(1);
MyClass _$MyClassFromJson(Map<String, dynamic> json) => const MyClass();
