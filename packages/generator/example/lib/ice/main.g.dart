// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Example _$ExampleFromJson(Map json) => _Example(
      json['name'] as String?,
      age: json['age'] as int?,
      isMale: json['isMale'] as bool?,
      friends:
          (json['friends'] as List<dynamic>?)?.map((e) => e as String).toList(),
      data: (json['data'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e),
      ),
      father: json['father'],
    );

Map<String, dynamic> _$ExampleToJson(_Example instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('age', instance.age);
  writeNotNull('isMale', instance.isMale);
  writeNotNull('friends', instance.friends);
  writeNotNull('data', instance.data);
  writeNotNull('father', instance.father?.toJson());
  return val;
}
