// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../ice_generic_copy_with_ctor.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Example<T> with EquatableMixin {
  const _$Example();

  const factory _$Example._$fromJson(T name,
      {required int code, required bool flag}) = Example;

  @TConv<T>()
  T get name;
  int get code;
  bool get flag;
  _$ExampleCopyWith get copyWith => _$ExampleCopyWith<T>(this);
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

Example _$ExampleFromJson<T>(Map<String, dynamic> json) {
  return _$$ExampleFromJson<T>(json) as Example;
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Example2<T> with EquatableMixin {
  const _$Example2();

  const factory _$Example2._$fromJson(T name,
      {required int code, required bool flag}) = Example2;

  @TConv<T>()
  T get name;
  int get code;
  bool get flag;
  _$Example2CopyWith get copyWith => _$Example2CopyWith<T>(this);
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

Example2 _$Example2FromJson<T>(Map<String, dynamic> json) {
  return _$$Example2FromJson<T>(json) as Example2;
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Example3<T> with EquatableMixin {
  const _$Example3();

  const factory _$Example3._$fromJson(T name,
      {required int code, required bool flag}) = Example3;

  @TConv<T>()
  T get name;
  int get code;
  bool get flag;
  _$Example3CopyWith get copyWith => _$Example3CopyWith<T>(this);
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

Example3 _$Example3FromJson<T>(Map<String, dynamic> json) {
  return _$$Example3FromJson<T>(json) as Example3;
}

const _$sentinelValue = Object();

abstract class _$ExampleCopyWith<T> {
  const factory _$ExampleCopyWith(_$Example<T> value) =
      _$ExampleCopyWithImpl<T>;
  Example call({String name, int code, bool flag});
}

class _$ExampleCopyWithImpl<T> implements _$ExampleCopyWith<T> {
  const _$ExampleCopyWithImpl(this._value);
  final _$Example<T> _value;
  Example call({
    Object? name = _$sentinelValue,
    Object? code = _$sentinelValue,
    Object? flag = _$sentinelValue,
  }) {
    return Example<T>.named(
        name == _$sentinelValue ? _value.name as String : name as String,
        code: code == _$sentinelValue ? _value.code as int : code as int,
        flag: flag == _$sentinelValue ? _value.flag as bool : flag as bool);
  }
}

abstract class _$Example2CopyWith<T> {
  const factory _$Example2CopyWith(_$Example2<T> value) =
      _$Example2CopyWithImpl<T>;
  Example2 call({String name, int code, bool flag});
}

class _$Example2CopyWithImpl<T> implements _$Example2CopyWith<T> {
  const _$Example2CopyWithImpl(this._value);
  final _$Example2<T> _value;
  Example2 call({
    Object? name = _$sentinelValue,
    Object? code = _$sentinelValue,
    Object? flag = _$sentinelValue,
  }) {
    return Example2<T>.named(
        name == _$sentinelValue ? _value.name as String : name as String,
        code: code == _$sentinelValue ? _value.code as int : code as int,
        flag: flag == _$sentinelValue ? _value.flag as bool : flag as bool);
  }
}

abstract class _$Example3CopyWith<T> {
  const factory _$Example3CopyWith(_$Example3<T> value) =
      _$Example3CopyWithImpl<T>;
  Example3 call({String name, int code, bool flag});
}

class _$Example3CopyWithImpl<T> implements _$Example3CopyWith<T> {
  const _$Example3CopyWithImpl(this._value);
  final _$Example3<T> _value;
  Example3 call({
    Object? name = _$sentinelValue,
    Object? code = _$sentinelValue,
    Object? flag = _$sentinelValue,
  }) {
    return Example3<T>.named(
        name == _$sentinelValue ? _value.name as String : name as String,
        code: code == _$sentinelValue ? _value.code as int : code as int,
        flag: flag == _$sentinelValue ? _value.flag as bool : flag as bool);
  }
}
