import 'package:ice_annotation/ice.dart';

part 'contained_union.g.dart';
part 'fixtures/contained_union.dart';
// part 'contained_union.ice.dart';

@IceUnion.contained()
class Example extends _$Example {
  const Example._();

  const factory Example.a(String name) = A;
  const factory Example.b(String name) = B;
  const factory Example.c(String name) = C;
}
