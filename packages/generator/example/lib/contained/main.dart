import 'package:ice_annotation/ice.dart';

part 'main.ice.dart';
part 'main.g.dart';
// Ice Annotation:
// remove equatable on false

@IceUnion.contained()
class Example extends _$Example {
  const Example._();

  const factory Example.a({@Default('hello world') String name}) = _A;
  const factory Example.b([@Default(5) int code]) = _B;
  const factory Example.c([@Default(<String>[]) dynamic value]) = _C;
  factory Example.d({MyClass myClass = const MyClass()}) {
    return Example.c(myClass);
  }
  const factory Example.e([@Default(<String>[]) dynamic myClass]) = _E;

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);
}

@Ice()
class MyClass extends _$MyClass {
  const MyClass();

  factory MyClass.fromJson(Map<String, dynamic> json) =>
      _$MyClassFromJson(json);
}
