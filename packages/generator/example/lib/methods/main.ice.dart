// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

extension on Example {
  Example copyWith({
    CopyCallback<String?>? text,
    CopyCallback<int?>? whole,
    CopyCallback<double?>? decimal,
    CopyCallback<bool?>? flag,
    CopyCallback<DateTime?>? date,
    CopyCallback<List<String>?>? list,
    CopyCallback<Map<String, String>?>? map,
    CopyCallback<Set<String>?>? set,
    CopyCallback<Example?>? example,
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
}

typedef CopyCallback<T> = T Function(T);
List<Object?> _$ExampleProps(Example instance) {
  return [
    instance.text,
    instance.whole,
    instance.decimal,
    instance.flag,
    instance.date,
    instance.list,
    instance.map,
    instance.set,
    instance.example
  ];
}

String _$ExampleToString(Example instance) {
  return '''
Example(
	text: ${instance.text},
	whole: ${instance.whole},
	decimal: ${instance.decimal},
	flag: ${instance.flag},
	date: ${instance.date},
	list: ${instance.list},
	map: ${instance.map},
	set: ${instance.set},
	example: ${instance.example},
)''';
}
