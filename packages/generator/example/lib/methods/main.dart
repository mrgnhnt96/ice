import 'package:ice_annotation/ice.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main.ice.dart';
part 'main.g.dart';

@copyWith
@props
@toString
@JsonSerializable()
class Example extends Equatable {
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

  final String? text;
  final int? whole;
  final double? decimal;
  final bool? flag;
  final DateTime? date;
  final List<String>? list;
  final Map<String, String>? map;
  final Set<String>? set;
  final Example? example;

  @override
  List<Object?> get props => _$ExampleProps(this);

  @override
  String toString() => _$ExampleToString(this);
}
