import 'package:ice_annotation/ice.dart';

part 'main.ice.dart';
part 'main.g.dart';

// Ice Annotation:
// remove equatable on false

@Ice()
class Example extends _$Example {
  const Example(
    this.name,
    this.other,
  );

  final String name;
  final Other? other;
}

@Ice(copyWith: CopyWith.anonymous)
class Other extends _$Other {
  const Other(this.code);

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

  final int code;
}
