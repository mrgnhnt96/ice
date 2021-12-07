// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Initial _$InitialFromJson(Map json) => _Initial();

Map<String, dynamic> _$InitialToJson(_Initial instance) => <String, dynamic>{};

_Ready _$ReadyFromJson(Map json) => _Ready(
      json['data'] as String,
    );

Map<String, dynamic> _$ReadyToJson(_Ready instance) => <String, dynamic>{
      'data': instance.data,
    };

_Error _$ErrorFromJson(Map json) => _Error(
      json['data'] as String,
      json['fix'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$ErrorToJson(_Error instance) => <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'fix': instance.fix,
    };
