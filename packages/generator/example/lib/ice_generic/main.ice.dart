// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Example<T> with EquatableMixin {
  const _$Example();

  const factory _$Example._$fromJson(T value) = Example;

  @TConv<T>()
  T get value;
  _$ExampleCopyWith get copyWith => _$ExampleCopyWith(this);
  @override
  List<Object?> get props {
    return [value];
  }

  @override
  String toString() {
    return r'Example(' 'value: $value)';
  }

  Map<String, dynamic> toJson() => _$$ExampleToJson(this);
}

Example _$ExampleFromJson(Map<String, dynamic> json) {
  return _$$ExampleFromJson(json) as Example;
}

const _$sentinelValue = Object();

abstract class _$ExampleCopyWith<T> {
  const factory _$ExampleCopyWith(_$Example value) = _$ExampleCopyWithImpl<T>;
  Example call({T value});
}

class _$ExampleCopyWithImpl<T> implements _$ExampleCopyWith<T> {
  const _$ExampleCopyWithImpl(this._value);
  final _$Example _value;
  Example call({
    Object? value = _$sentinelValue,
  }) {
    return Example(value == _$sentinelValue ? _value.value : value as T);
  }
}
