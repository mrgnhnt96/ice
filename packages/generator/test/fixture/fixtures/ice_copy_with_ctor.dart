// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../ice_copy_with_ctor.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Example with EquatableMixin {
  const _$Example();

  const factory _$Example._$fromJson(String name,
      {required int code, required bool flag}) = Example;

  String get name;
  int get code;
  bool get flag;
  Example copyWith() => Example.no();
  @override
  List<Object?> get props {
    return [name, code, flag];
  }

  @override
  String toString() {
    return r'Example(' 'name: $name, ' 'code: $code, ' 'flag: $flag)';
  }

  Map<String, dynamic> toJson() => _$$ExampleToJson(this);
}

Example _$ExampleFromJson(Map<String, dynamic> json) {
  return _$$ExampleFromJson(json) as Example;
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Example2 with EquatableMixin {
  const _$Example2();

  const factory _$Example2._$fromJson(String name,
      {required int code, required bool flag}) = Example2;

  String get name;
  int get code;
  bool get flag;
  _$Example2CopyWith get copyWith => _$Example2CopyWith(this);
  @override
  List<Object?> get props {
    return [name, code, flag];
  }

  @override
  String toString() {
    return r'Example2(' 'name: $name, ' 'code: $code, ' 'flag: $flag)';
  }

  Map<String, dynamic> toJson() => _$$Example2ToJson(this);
}

Example2 _$Example2FromJson(Map<String, dynamic> json) {
  return _$$Example2FromJson(json) as Example2;
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Example3 with EquatableMixin {
  const _$Example3();

  const factory _$Example3._$fromJson(String name,
      {required int code, required bool flag}) = Example3;

  String get name;
  int get code;
  bool get flag;
  _$Example3CopyWith get copyWith => _$Example3CopyWith(this);
  @override
  List<Object?> get props {
    return [name, code, flag];
  }

  @override
  String toString() {
    return r'Example3(' 'name: $name, ' 'code: $code, ' 'flag: $flag)';
  }

  Map<String, dynamic> toJson() => _$$Example3ToJson(this);
}

Example3 _$Example3FromJson(Map<String, dynamic> json) {
  return _$$Example3FromJson(json) as Example3;
}

const _$sentinelValue = Object();

abstract class _$Example2CopyWith {
  const factory _$Example2CopyWith(_$Example2 value) = _$Example2CopyWithImpl;
  Example2 call({String name, int code, bool flag});
}

class _$Example2CopyWithImpl implements _$Example2CopyWith {
  const _$Example2CopyWithImpl(this._value);
  final _$Example2 _value;
  Example2 call({
    Object? name = _$sentinelValue,
    Object? code = _$sentinelValue,
    Object? flag = _$sentinelValue,
  }) {
    return Example2.not(
        name == _$sentinelValue ? _value.name as String : name as String,
        code == _$sentinelValue ? _value.code as int : code as int,
        flag == _$sentinelValue ? _value.flag as bool : flag as bool);
  }
}

abstract class _$Example3CopyWith {
  const factory _$Example3CopyWith(_$Example3 value) = _$Example3CopyWithImpl;
  Example3 call({int code});
}

class _$Example3CopyWithImpl implements _$Example3CopyWith {
  const _$Example3CopyWithImpl(this._value);
  final _$Example3 _value;
  Example3 call({
    Object? code = _$sentinelValue,
  }) {
    return Example3.some(
        code == _$sentinelValue ? _value.code as int : code as int);
  }
}
