// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Example _$ExampleFromJson(Map json) => Example(
      text: json['text'] as String?,
      whole: json['whole'] as int?,
      decimal: (json['decimal'] as num?)?.toDouble(),
      flag: json['flag'] as bool?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      list: (json['list'] as List<dynamic>?)?.map((e) => e as String).toList(),
      set: (json['set'] as List<dynamic>?)?.map((e) => e as String).toSet(),
      example: json['example'] == null
          ? null
          : Example.fromJson(Map<String, dynamic>.from(json['example'] as Map)),
    );

Map<String, dynamic> _$ExampleToJson(Example instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('whole', instance.whole);
  writeNotNull('decimal', instance.decimal);
  writeNotNull('flag', instance.flag);
  writeNotNull('date', instance.date?.toIso8601String());
  writeNotNull('list', instance.list);
  writeNotNull('set', instance.set?.toList());
  writeNotNull('example', instance.example?.toJson());
  return val;
}
