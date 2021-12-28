// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

extension $ExampleX on Example {
  /// If `null` is passed within the `copyWith` method,
  /// the current value will be returned.
  ///
  /// ```dart
  /// myClass.copyWith(field: newValue);
  /// ```
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
        example: example ?? this.example);
  }

  List<Object?> get _$props {
    return [text, whole, decimal, flag, date, list, map, set, example];
  }

  String _$toString() {
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
