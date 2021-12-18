// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

extension on Example {
  Example copyWith() {
    return Example.empty();
  }

  Map<String, dynamic> toJson() => _$ExampleToJson(this);
}

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
