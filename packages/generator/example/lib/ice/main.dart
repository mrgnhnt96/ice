import 'package:ice_annotation/ice.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main.ice.dart';
part 'main.g.dart';
part 'state.dart';

// Ice Annotation:
// remove equatable on false

@Ice(
  copyWithType: CopyWithType.typeSafe,
)
@IceUnion.of(State)
@JsonSerializable()
class Example extends _$Example {
  const Example({
    this.text,
    this.whole,
    this.decimal,
    this.flag,
    this.date,
    this.list,
    this.set,
    this.example,
  }) : super.empty();

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);

  final String? text;
  final int? whole;
  final double? decimal;
  final bool? flag;
  final DateTime? date;
  final List<String>? list;
  final Set<String>? set;
  final Example? example;
}

@Ice(
  copyWithType: CopyWithType.simple,
)
@IceUnion.of(State)
class Other extends _$Other {
  Other(int code) : super(code);
}

@IceUnion.of(State)
class Error extends _$Error {
  Error(int code) : super(code);
}
