// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$Example with EquatableMixin {
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

  Example copyWith() {
    return Example.empty();
  }

  @override
  List<Object?> get props {
    return [text, whole, decimal, flag, date, list, map, set, example];
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
