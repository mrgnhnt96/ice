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
  const factory Example.c([@Default(<String>[]) dynamic myClass]) = _C;
  factory Example.d({dynamic name = const MyClass()}) {
    return const Example.c(MyClass());
  }
  const factory Example.e([@Default(<String>[]) dynamic myClass]) = _E;

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);
}

class MyClass {
  const MyClass();
}
