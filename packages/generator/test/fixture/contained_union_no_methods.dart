import 'package:ice_annotation/ice.dart';

part 'fixtures/contained_union_no_methods.dart';

@IceUnion.contained(
  copyWith: CopyWith.none,
  equatable: false,
  jsonSerializable: null,
  toString: false,
)
class Example extends _$Example {
  const Example._();

  const factory Example.a(String name) = _A;
  const factory Example.b(String name) = _B;
  const factory Example.c(String name, int code, bool flag) = _C;
}
