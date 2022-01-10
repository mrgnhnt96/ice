// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../ice_ignore_getters.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$Example {
  const _$Example();

  String get name;
  int get code;
  bool get flag;
  String get other;

  /// 'null' safe
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  Example copyWith({
    _$CopyCallback<String>? name,
    _$CopyCallback<int>? code,
    _$CopyCallback<bool>? flag,
  }) {
    return Example(name == null ? this.name : name(this.name),
        code: code == null ? this.code : code(this.code),
        flag: flag == null ? this.flag : flag(this.flag));
  }
}

typedef _$CopyCallback<T> = T Function(T);
