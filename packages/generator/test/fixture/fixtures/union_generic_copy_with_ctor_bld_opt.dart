// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../union_generic_copy_with_ctor.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$Example<T> extends State {
  const _$Example() : super();

  @TConv<T>()
  T get name;
  int get code;
  bool get flag;
  _$ExampleCopyWith get copyWith => _$ExampleCopyWith<T>(this);

  @override
  String toString() {
    return r'State.Example(' 'name: $name, ' 'code: $code, ' 'flag: $flag)';
  }
}

abstract class _$Example2<T> extends State {
  const _$Example2() : super();

  @TConv<T>()
  T get name;
  int get code;
  bool get flag;
  _$Example2CopyWith get copyWith => _$Example2CopyWith<T>(this);

  @override
  String toString() {
    return r'State.Example2(' 'name: $name, ' 'code: $code, ' 'flag: $flag)';
  }
}

abstract class _$Example3<T> extends State {
  const _$Example3() : super();

  @TConv<T>()
  T get name;
  int get code;
  bool get flag;
  _$Example3CopyWith get copyWith => _$Example3CopyWith<T>(this);

  @override
  String toString() {
    return r'State.Example3(' 'name: $name, ' 'code: $code, ' 'flag: $flag)';
  }
}

abstract class _$State with _$StateMixin {
  const _$State();

  @override
  String toString() {
    return r'State()';
  }
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

typedef _$StateCallback<_$R, _$T extends State> = _$R Function(_$T);
typedef _$NoStateCallback<_$R> = _$R Function();
