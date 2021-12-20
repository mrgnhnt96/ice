import 'package:ice_annotation/ice.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main.ice.dart';
part 'main.g.dart';

// Ice Annotation:
// remove equatable on false

@Ice(
  equatable: false,
  copyWithType: CopyWithType.simple,
)
@JsonSerializable()
class Example extends _$Example {
  const Example({
    this.text,
    this.whole,
    this.decimal,
    this.flag,
    this.date,
    this.list,
    this.map,
    this.set,
    this.example,
  });

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);

  final String? text;
  final int? whole;
  final double? decimal;
  final bool? flag;
  final DateTime? date;
  final List<String>? list;
  final Map<String, String>? map;
  final Set<String>? set;
  final Example? example;
}
