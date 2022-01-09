import 'package:ice_annotation/ice.dart';

part 'contained_union.g.dart';
part 'fixtures/contained_union.dart';

@IceUnion.contained()
class Example extends _$Example {
  const Example._();

  const factory Example.a(String name) = _A;
  const factory Example.b(String name) = _B;
  const factory Example.c(String name) = _C;
}
