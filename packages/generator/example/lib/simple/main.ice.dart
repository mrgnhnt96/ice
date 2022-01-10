// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Example with EquatableMixin {
  const _$Example();

  const factory _$Example._$fromJson(String name, Other? other) = Example;

  String get name;
  Other? get other;
  _$ExampleCopyWith get copyWith => _$ExampleCopyWith(this);
  @override
  List<Object?> get props {
    return [name, other];
  }

  @override
  String toString() {
    return r'Example(' 'name: $name, ' 'other: $other)';
  }

  Map<String, dynamic> toJson() => _$$ExampleToJson(this);
}

Example _$ExampleFromJson(Map<String, dynamic> json) {
  return _$$ExampleFromJson(json) as Example;
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Other with EquatableMixin {
  const _$Other();

  const factory _$Other._$fromJson(int code) = Other;

  int get code;

  /// 'null' safe
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  Other copyWith({
    _$CopyCallback<int>? code,
  }) {
    return Other(code == null ? this.code : code(this.code));
  }

  @override
  List<Object?> get props {
    return [code];
  }

  @override
  String toString() {
    return r'Other(' 'code: $code)';
  }

  Map<String, dynamic> toJson() => _$$OtherToJson(this);
}

Other _$OtherFromJson(Map<String, dynamic> json) {
  return _$$OtherFromJson(json) as Other;
}

const _$sentinelValue = Object();

abstract class _$ExampleCopyWith {
  const factory _$ExampleCopyWith(_$Example value) = _$ExampleCopyWithImpl;
  Example call({String name, Other? other});
}

class _$ExampleCopyWithImpl implements _$ExampleCopyWith {
  const _$ExampleCopyWithImpl(this._value);
  final _$Example _value;
  Example call({
    Object? name = _$sentinelValue,
    Object? other = _$sentinelValue,
  }) {
    return Example(
        name == _$sentinelValue ? _value.name as String : name as String,
        other == _$sentinelValue ? _value.other as Other? : other as Other?);
  }
}

typedef _$CopyCallback<T> = T Function(T);
