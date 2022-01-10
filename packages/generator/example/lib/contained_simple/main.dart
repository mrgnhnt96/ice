import 'package:ice_annotation/ice.dart';

part 'main.ice.dart';

@IceUnion.contained(
  copyWith: CopyWith.none,
  equatable: false,
  jsonSerializable: null,
  toString: false,
)
class Example extends _$Example {
  const Example._();

  const factory Example.a(String name) = A;
  const factory Example.b(String name) = B;
  const factory Example.c(String name, int code, bool flag) = C;
}
