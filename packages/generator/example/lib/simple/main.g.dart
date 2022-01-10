// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Example _$$ExampleFromJson(Map<String, dynamic> json) => _$Example._$fromJson(
      json['name'] as String,
      json['other'] == null
          ? null
          : Other.fromJson(json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExampleToJson(_$Example instance) => <String, dynamic>{
      'name': instance.name,
      'other': instance.other?.toJson(),
    };

_$Other _$$OtherFromJson(Map<String, dynamic> json) => _$Other._$fromJson(
      json['code'] as int,
    );

Map<String, dynamic> _$$OtherToJson(_$Other instance) => <String, dynamic>{
      'code': instance.code,
    };
