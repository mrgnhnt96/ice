// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$Example {
  const _$Example();

  String? get text;
  int? get whole;
  double? get decimal;
  bool? get flag;
  DateTime? get date;
  List<String>? get list;
  Map<String, String>? get map;
  Set<String>? get set;
  Example? get example;

  Example copyWith({
    String? text,
    int? whole,
    double? decimal,
    bool? flag,
    DateTime? date,
    List<String>? list,
    Map<String, String>? map,
    Set<String>? set,
    Example? example,
  }) {
    return Example(
      text: text ?? this.text,
      whole: whole ?? this.whole,
      decimal: decimal ?? this.decimal,
      flag: flag ?? this.flag,
      date: date ?? this.date,
      list: list ?? this.list,
      map: map ?? this.map,
      set: set ?? this.set,
      example: example ?? this.example,
    );
  }

  @override
  String toString() {
    return '''
Example(
	text: $text,
	whole: $whole,
	decimal: $decimal,
	flag: $flag,
	date: $date,
	list: $list,
	map: $map,
	set: $set,
	example: $example,
)''';
  }
}

extension on Example {
  Map<String, dynamic> toJson() => _$ExampleToJson(this);
}
