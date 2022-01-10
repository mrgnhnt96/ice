// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../union_generic_json_ctor.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$Example<T> extends State {
  const _$Example() : super();

  @TConv<T>()
  T get name;
  int get code;
  bool get flag;

  /// 'null' safe
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  Example copyWith({
    _$CopyCallback<T>? name,
    _$CopyCallback<int>? code,
    _$CopyCallback<bool>? flag,
  }) {
    return Example(name == null ? this.name : name(this.name),
        code: code == null ? this.code : code(this.code),
        flag: flag == null ? this.flag : flag(this.flag));
  }
}

abstract class _$Example2<T> extends State {
  const _$Example2() : super();

  @TConv<T>()
  T get name;
  int get code;
  bool get flag;

  /// 'null' safe
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  Example2 copyWith({
    _$CopyCallback<T>? name,
    _$CopyCallback<int>? code,
    _$CopyCallback<bool>? flag,
  }) {
    return Example2(name == null ? this.name : name(this.name),
        code: code == null ? this.code : code(this.code),
        flag: flag == null ? this.flag : flag(this.flag));
  }
}

abstract class _$Example3<T> extends State {
  const _$Example3() : super();

  @TConv<T>()
  T get name;
  int get code;
  bool get flag;

  /// 'null' safe
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  Example3 copyWith({
    _$CopyCallback<T>? name,
    _$CopyCallback<int>? code,
    _$CopyCallback<bool>? flag,
  }) {
    return Example3(name == null ? this.name : name(this.name),
        code: code == null ? this.code : code(this.code),
        flag: flag == null ? this.flag : flag(this.flag));
  }
}

abstract class _$State with _$StateMixin {
  const _$State();
}

class _$StateTearOffs {
  const _$StateTearOffs();
  State example<T>(T name, {required int code, required bool flag}) {
    return Example<T>(name, code: code, flag: flag);
  }

  State example2<T>(T name, {required int code, required bool flag}) {
    return Example2<T>(name, code: code, flag: flag);
  }

  State example3<T>(T name, {required int code, required bool flag}) {
    return Example3<T>(name, code: code, flag: flag);
  }
}

mixin _$StateMixin {
  _$R map<_$R extends Object?>({
    required _$StateCallback<_$R, _$Example> example,
    required _$StateCallback<_$R, _$Example2> example2,
    required _$StateCallback<_$R, _$Example3> example3,
  }) {
    switch (runtimeType) {
      case _$Example:
        return example(this as _$Example);
      case _$Example2:
        return example2(this as _$Example2);
      case _$Example3:
        return example3(this as _$Example3);
      default:
        throw UnsupportedError('Unsupported type: $this');
    }
  }

  _$R when<_$R extends Object?>({
    required _$R Function<T>(
      T name,
      int code,
      bool flag,
    )
        example,
    required _$R Function<T>(
      T name,
      int code,
      bool flag,
    )
        example2,
    required _$R Function<T>(
      T name,
      int code,
      bool flag,
    )
        example3,
  }) {
    return map(
      example: (u) => example.call(
        u.name,
        u.code,
        u.flag,
      ),
      example2: (u) => example2.call(
        u.name,
        u.code,
        u.flag,
      ),
      example3: (u) => example3.call(
        u.name,
        u.code,
        u.flag,
      ),
    );
  }

  _$R maybeMap<_$R extends Object?>({
    _$StateCallback<_$R, _$Example>? example,
    _$StateCallback<_$R, _$Example2>? example2,
    _$StateCallback<_$R, _$Example3>? example3,
    required _$NoStateCallback<_$R> orElse,
  }) {
    return map(
      example: (u) => example?.call(u) ?? orElse(),
      example2: (u) => example2?.call(u) ?? orElse(),
      example3: (u) => example3?.call(u) ?? orElse(),
    );
  }

  _$R maybeWhen<_$R extends Object?>({
    _$R Function<T>(
      T name,
      int code,
      bool flag,
    )?
        example,
    _$R Function<T>(
      T name,
      int code,
      bool flag,
    )?
        example2,
    _$R Function<T>(
      T name,
      int code,
      bool flag,
    )?
        example3,
    required _$NoStateCallback<_$R> orElse,
  }) {
    return map(
      example: (u) =>
          example?.call(
            u.name,
            u.code,
            u.flag,
          ) ??
          orElse(),
      example2: (u) =>
          example2?.call(
            u.name,
            u.code,
            u.flag,
          ) ??
          orElse(),
      example3: (u) =>
          example3?.call(
            u.name,
            u.code,
            u.flag,
          ) ??
          orElse(),
    );
  }

  _$R? mapOrNull<_$R extends Object?>({
    _$StateCallback<_$R, _$Example>? example,
    _$StateCallback<_$R, _$Example2>? example2,
    _$StateCallback<_$R, _$Example3>? example3,
  }) {
    return map(
      example: (u) => example?.call(u),
      example2: (u) => example2?.call(u),
      example3: (u) => example3?.call(u),
    );
  }

  _$R? whenOrNull<_$R extends Object?>({
    _$R Function<T>(
      T name,
      int code,
      bool flag,
    )?
        example,
    _$R Function<T>(
      T name,
      int code,
      bool flag,
    )?
        example2,
    _$R Function<T>(
      T name,
      int code,
      bool flag,
    )?
        example3,
  }) {
    return map(
      example: (u) => example?.call(
        u.name,
        u.code,
        u.flag,
      ),
      example2: (u) => example2?.call(
        u.name,
        u.code,
        u.flag,
      ),
      example3: (u) => example3?.call(
        u.name,
        u.code,
        u.flag,
      ),
    );
  }

  Example get asExample {
    if (!isExample) {
      throw Exception('State runtimeType is not of type Example');
    }
    return this as Example;
  }

  Example2 get asExample2 {
    if (!isExample2) {
      throw Exception('State runtimeType is not of type Example2');
    }
    return this as Example2;
  }

  Example3 get asExample3 {
    if (!isExample3) {
      throw Exception('State runtimeType is not of type Example3');
    }
    return this as Example3;
  }

  bool get isExample => this is Example;
  bool get isExample2 => this is Example2;
  bool get isExample3 => this is Example3;
}
typedef _$CopyCallback<T> = T Function(T);
typedef _$StateCallback<_$R, _$T extends State> = _$R Function(_$T);
typedef _$NoStateCallback<_$R> = _$R Function();
