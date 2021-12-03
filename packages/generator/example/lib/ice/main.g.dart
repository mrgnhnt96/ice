// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Example _$ExampleFromJson(Map<String, dynamic> json) => Example(
      json['name'] as String?,
      age: json['age'] as int?,
      isMale: json['isMale'] as bool?,
      friends:
          (json['friends'] as List<dynamic>?)?.map((e) => e as String).toList(),
      data: json['data'] as Map<String, dynamic>?,
      father: json['father'] == null
          ? null
          : Example.fromJson(json['father'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExampleToJson(Example instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'isMale': instance.isMale,
      'friends': instance.friends,
      'data': instance.data,
      'father': instance.father,
    };
