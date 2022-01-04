// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Example<T> _$$ExampleFromJson<T>(Map<String, dynamic> json) =>
    _$Example<T>._$fromJson(
      TConv<T>().fromJson(json['value'] as String),
    );

Map<String, dynamic> _$$ExampleToJson<T>(_$Example<T> instance) =>
    <String, dynamic>{
      'value': TConv<T>().toJson(instance.value),
    };
