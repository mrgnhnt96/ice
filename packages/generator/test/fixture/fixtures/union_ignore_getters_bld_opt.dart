// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../union_ignore_getters.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$Example extends State {
  const _$Example() : super();

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

abstract class _$Other extends State {
  const _$Other() : super();

  Other copyWith() => Other();
}

abstract class _$State with _$StateMixin {
  const _$State();
}

class _$StateTearOffs {
  const _$StateTearOffs();
  State example(String name, {required int code, required bool flag}) {
    return Example(name, code: code, flag: flag);
  }

  State other() {
    return Other();
  }
}

mixin _$StateMixin {
  _$R map<_$R extends Object?>({
    required _$StateCallback<_$R, _$Example> example,
    required _$StateCallback<_$R, _$Other> other,
  }) {
    switch (runtimeType) {
      case _$Example:
        return example(this as _$Example);
      case _$Other:
        return other(this as _$Other);
      default:
        throw UnsupportedError('Unsupported type: $this');
    }
  }

  _$R when<_$R extends Object?>({
    required _$R Function(
      String name,
      int code,
      bool flag,
      String other,
    )
        example,
    required _$R Function() other,
  }) {
    return map(
      example: (u) => example.call(
        u.name,
        u.code,
        u.flag,
        u.other,
      ),
      other: (u) => other.call(),
    );
  }

  _$R maybeMap<_$R extends Object?>({
    _$StateCallback<_$R, _$Example>? example,
    _$StateCallback<_$R, _$Other>? other,
    required _$NoStateCallback<_$R> orElse,
  }) {
    return map(
      example: (u) => example?.call(u) ?? orElse(),
      other: (u) => other?.call(u) ?? orElse(),
    );
  }

  _$R maybeWhen<_$R extends Object?>({
    _$R Function(
      String name,
      int code,
      bool flag,
      String other,
    )?
        example,
    _$R Function()? other,
    required _$NoStateCallback<_$R> orElse,
  }) {
    return map(
      example: (u) =>
          example?.call(
            u.name,
            u.code,
            u.flag,
            u.other,
          ) ??
          orElse(),
      other: (u) => other?.call() ?? orElse(),
    );
  }

  _$R? mapOrNull<_$R extends Object?>({
    _$StateCallback<_$R, _$Example>? example,
    _$StateCallback<_$R, _$Other>? other,
  }) {
    return map(
      example: (u) => example?.call(u),
      other: (u) => other?.call(u),
    );
  }

  _$R? whenOrNull<_$R extends Object?>({
    _$R Function(
      String name,
      int code,
      bool flag,
      String other,
    )?
        example,
    _$R Function()? other,
  }) {
    return map(
      example: (u) => example?.call(
        u.name,
        u.code,
        u.flag,
        u.other,
      ),
      other: (u) => other?.call(),
    );
  }

  Example get asExample {
    if (!isExample) {
      throw Exception('State runtimeType is not of type Example');
    }
    return this as Example;
  }

  Other get asOther {
    if (!isOther) {
      throw Exception('State runtimeType is not of type Other');
    }
    return this as Other;
  }

  bool get isExample => this is Example;
  bool get isOther => this is Other;
}
typedef _$CopyCallback<T> = T Function(T);
typedef _$StateCallback<_$R, _$T extends State> = _$R Function(_$T);
typedef _$NoStateCallback<_$R> = _$R Function();
