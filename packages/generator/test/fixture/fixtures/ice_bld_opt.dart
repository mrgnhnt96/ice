// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../ice.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$Example {
  const _$Example();

  String get name;
  int get code;
  bool get flag;
  _$ExampleCopyWith get copyWith => _$ExampleCopyWith(this);

  @override
  String toString() {
    return r'Example(' 'name: $name, ' 'code: $code, ' 'flag: $flag)';
  }
}

const _$sentinelValue = Object();

abstract class _$ExampleCopyWith {
  const factory _$ExampleCopyWith(_$Example value) = _$ExampleCopyWithImpl;
  Example call({String name, int code, bool flag});
}

class _$ExampleCopyWithImpl implements _$ExampleCopyWith {
  const _$ExampleCopyWithImpl(this._value);
  final _$Example _value;
  Example call({
    Object? name = _$sentinelValue,
    Object? code = _$sentinelValue,
    Object? flag = _$sentinelValue,
  }) {
    return Example(
        name == _$sentinelValue ? _value.name as String : name as String,
        code: code == _$sentinelValue ? _value.code as int : code as int,
        flag: flag == _$sentinelValue ? _value.flag as bool : flag as bool);
  }
}
