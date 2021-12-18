import 'package:ice_annotation/ice.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main.ice.dart';
part 'main.g.dart';

@Ice()
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

  @copyWithEntryPoint
  const Example.empty()
      : this(
          text: '',
          whole: 0,
          decimal: 0.0,
          flag: false,
          list: const [],
          map: const {},
          set: const {},
          example: const Example.empty(),
        );

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
