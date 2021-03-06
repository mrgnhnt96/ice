import 'package:ice_annotation/ice.dart';

part 'main.g.dart';
part 'main.ice.dart';

@Ice.only(toString: true, props: true, copyWith: CopyWith.nullSafe)
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

  Map<String, dynamic> toJson() => _$ExampleToJson(this);

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
  List<Object?> get props => _$props;

  @override
  String toString() => _$toString();
}
