// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../ice_copy_with_ctor.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$Example {
  const _$Example();

  String get name;
  int get code;
  bool get flag;
  Example copyWith() => Example.no();
}

abstract class _$Example2 {
  const _$Example2();

  String get name;
  int get code;
  bool get flag;

  /// 'null' safe
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  Example2 copyWith({
    _$CopyCallback<String>? name,
    _$CopyCallback<int>? code,
    _$CopyCallback<bool>? flag,
  }) {
    return Example2.not(
        name == null ? this.name : name(this.name),
        code == null ? this.code : code(this.code),
        flag == null ? this.flag : flag(this.flag));
  }
}

abstract class _$Example3 {
  const _$Example3();

  String get name;
  int get code;
  bool get flag;

  /// 'null' safe
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  Example3 copyWith({
    _$CopyCallback<int>? code,
  }) {
    return Example3.some(code == null ? this.code : code(this.code));
  }
}

typedef _$CopyCallback<T> = T Function(T);
