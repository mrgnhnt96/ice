// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Example _$ExampleFromJson(Map<String, dynamic> json) => Example(
      text: json['text'] as String?,
      whole: json['whole'] as int?,
      decimal: (json['decimal'] as num?)?.toDouble(),
      flag: json['flag'] as bool?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      list: (json['list'] as List<dynamic>?)?.map((e) => e as String).toList(),
      map: (json['map'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      set: (json['set'] as List<dynamic>?)?.map((e) => e as String).toSet(),
      example: json['example'] == null
          ? null
          : Example.fromJson(json['example'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExampleToJson(Example instance) => <String, dynamic>{
      'text': instance.text,
      'whole': instance.whole,
      'decimal': instance.decimal,
      'flag': instance.flag,
      'date': instance.date?.toIso8601String(),
      'list': instance.list,
      'map': instance.map,
      'set': instance.set?.toList(),
      'example': instance.example?.toJson(),
    };
