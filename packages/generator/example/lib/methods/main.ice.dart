// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

extension $ExampleX on Example {
  /// if `null` is passed within the `copyWith` method,
  /// `null` will be returned.
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  Example copyWith({
    _$CopyCallback<String?>? text,
    _$CopyCallback<int?>? whole,
    _$CopyCallback<double?>? decimal,
    _$CopyCallback<bool?>? flag,
    _$CopyCallback<DateTime?>? date,
    _$CopyCallback<List<String>?>? list,
    _$CopyCallback<Map<String, String>?>? map,
    _$CopyCallback<Set<String>?>? set,
    _$CopyCallback<Example?>? example,
  }) {
    return Example(
        text: text == null ? this.text : text(this.text),
        whole: whole == null ? this.whole : whole(this.whole),
        decimal: decimal == null ? this.decimal : decimal(this.decimal),
        flag: flag == null ? this.flag : flag(this.flag),
        date: date == null ? this.date : date(this.date),
        list: list == null ? this.list : list(this.list),
        map: map == null ? this.map : map(this.map),
        set: set == null ? this.set : set(this.set),
        example: example == null ? this.example : example(this.example));
  }

  Map<String, dynamic> toJson() => _$ExampleToJson(this);
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

typedef _$CopyCallback<T> = T Function(T);
