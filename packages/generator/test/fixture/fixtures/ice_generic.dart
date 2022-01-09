// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../ice_generic.dart';

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

const _$sentinelValue = Object();

abstract class _$ExampleCopyWith<T> {
  const factory _$ExampleCopyWith(_$Example<T> value) =
      _$ExampleCopyWithImpl<T>;
  Example call({T name, int code, bool flag});
}

class _$ExampleCopyWithImpl<T> implements _$ExampleCopyWith<T> {
  const _$ExampleCopyWithImpl(this._value);
  final _$Example<T> _value;
  Example call({
    Object? name = _$sentinelValue,
    Object? code = _$sentinelValue,
    Object? flag = _$sentinelValue,
  }) {
    return Example<T>(name == _$sentinelValue ? _value.name as T : name as T,
        code: code == _$sentinelValue ? _value.code as int : code as int,
        flag: flag == _$sentinelValue ? _value.flag as bool : flag as bool);
  }
}
