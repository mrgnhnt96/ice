import 'package:ice_annotation/ice.dart';

part 'main.ice.dart';
part 'main.g.dart';

@IceUnion.contained()
class Example extends _$Example {
  const Example._();

  const factory Example.a({@Default('hello world') String? name}) = _A;
  const factory Example.b({@Default('hi') String name}) = _B;
  const factory Example.c({@Default(Example) dynamic myClass}) = _C;

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);
}
