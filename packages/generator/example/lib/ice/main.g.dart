// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Example _$$ExampleFromJson(Map<String, dynamic> json) => _$Example._$fromJson(
      text: json['text'] as String?,
      whole: json['whole'] as int?,
      decimal: (json['decimal'] as num?)?.toDouble(),
      flag: json['flag'] as bool?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      list: (json['list'] as List<dynamic>?)?.map((e) => e as String).toList(),
      set: (json['set'] as List<dynamic>?)?.map((e) => e as String).toSet(),
    );

Map<String, dynamic> _$$ExampleToJson(_$Example instance) => <String, dynamic>{
      'text': instance.text,
      'whole': instance.whole,
      'decimal': instance.decimal,
      'flag': instance.flag,
      'date': instance.date?.toIso8601String(),
      'list': instance.list,
      'set': instance.set?.toList(),
    };

_$Other _$$OtherFromJson(Map<String, dynamic> json) => _$Other._$fromJson(
      json['code'] as int,
    );

Map<String, dynamic> _$$OtherToJson(_$Other instance) => <String, dynamic>{
      'code': instance.code,
    };

_$Error _$$ErrorFromJson(Map<String, dynamic> json) => _$Error._$fromJson(
      json['code'] as int,
    );

Map<String, dynamic> _$$ErrorToJson(_$Error instance) => <String, dynamic>{
      'code': instance.code,
    };

_$State _$$StateFromJson(Map<String, dynamic> json) => _$State._$fromJson(
      json['code'] as int,
    );

Map<String, dynamic> _$$StateToJson(_$State instance) => <String, dynamic>{
      'code': instance.code,
    };
