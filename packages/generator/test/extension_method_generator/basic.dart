import 'package:ice_annotation/ice.dart';

part 'output/basic.dart';

@copyWith
@props
@toString
class Example extends Equatable {
  const Example._({
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
  factory Example.fromJson({
    String? text,
    int? whole,
    double? decimal,
  }) =>
      Example._(
        text: text,
        whole: whole,
        decimal: decimal,
      );

  static Example something() => Example._();

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
  String toString() => _ExampleToString();
}
