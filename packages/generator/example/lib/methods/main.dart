import 'package:ice_annotation/ice.dart';

part 'main.g.dart';
part 'main.ice.dart';

@IceCopyWith.typeSafe
@iceProps
@iceToString
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
