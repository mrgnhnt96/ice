// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../contained_union_generic.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Example<T> with _$ExampleMixin, EquatableMixin {
  const _$Example();

  factory _$Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);
  const factory _$Example._$fromJson() = Example._;

  @override
  List<Object?> get props {
    return [];
  }

  @override
  String toString() {
    return r'Example()';
  }
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
class _A<T> extends Example<T> {
  const _A(
    this.name,
  ) : super._();

  factory _A.fromJson(Map<String, dynamic> json) => _$AFromJson(json);
  const factory _A._$fromJson(T name) = _A;

  @TConv()
  final T name;
  _ACopyWith get copyWith => _ACopyWith<T>(this);
  @override
  List<Object?> get props {
    return [name];
  }

  @override
  String toString() {
    return r'Example._A(' 'name: $name)';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$AToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = r'_A';
    }
    return map;
  }
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
class _B<T> extends Example<T> {
  const _B(
    this.name,
  ) : super._();

  factory _B.fromJson(Map<String, dynamic> json) => _$BFromJson(json);
  const factory _B._$fromJson(String name) = _B;

  final String name;
  _BCopyWith get copyWith => _BCopyWith<T>(this);
  @override
  List<Object?> get props {
    return [name];
  }

  @override
  String toString() {
    return r'Example._B(' 'name: $name)';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$BToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = r'_B';
    }
    return map;
  }
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
class _C<T> extends Example<T> {
  const _C(
    this.name,
    this.code,
    this.flag,
  ) : super._();

  factory _C.fromJson(Map<String, dynamic> json) => _$CFromJson(json);
  const factory _C._$fromJson(String name, int code, bool flag) = _C;

  final String name;
  final int code;
  final bool flag;
  _CCopyWith get copyWith => _CCopyWith<T>(this);
  @override
  List<Object?> get props {
    return [name, code, flag];
  }

  @override
  String toString() {
    return r'Example._C(' 'name: $name, ' 'code: $code, ' 'flag: $flag)';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$CToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = r'_C';
    }
    return map;
  }
}

mixin _$ExampleMixin {
  _$R map<_$R extends Object?>({
    required _$ExampleCallback<_$R, _A> a,
    required _$ExampleCallback<_$R, _B> b,
    required _$ExampleCallback<_$R, _C> c,
  }) {
    switch (runtimeType) {
      case _A:
        return a(this as _A);
      case _B:
        return b(this as _B);
      case _C:
        return c(this as _C);
      default:
        throw UnsupportedError('Unsupported type: $this');
    }
  }

  _$R when<_$R extends Object?>({
    required _$R Function<T>(
      T name,
    )
        a,
    required _$R Function<T>(
      String name,
    )
        b,
    required _$R Function<T>(
      String name,
      int code,
      bool flag,
    )
        c,
  }) {
    return map(
      a: (u) => a.call(
        u.name,
      ),
      b: (u) => b.call(
        u.name,
      ),
      c: (u) => c.call(
        u.name,
        u.code,
        u.flag,
      ),
    );
  }

  _$R maybeMap<_$R extends Object?>({
    _$ExampleCallback<_$R, _A>? a,
    _$ExampleCallback<_$R, _B>? b,
    _$ExampleCallback<_$R, _C>? c,
    required _$NoExampleCallback<_$R> orElse,
  }) {
    return map(
      a: (u) => a?.call(u) ?? orElse(),
      b: (u) => b?.call(u) ?? orElse(),
      c: (u) => c?.call(u) ?? orElse(),
    );
  }

  _$R maybeWhen<_$R extends Object?>({
    _$R Function<T>(
      T name,
    )?
        a,
    _$R Function<T>(
      String name,
    )?
        b,
    _$R Function<T>(
      String name,
      int code,
      bool flag,
    )?
        c,
    required _$NoExampleCallback<_$R> orElse,
  }) {
    return map(
      a: (u) =>
          a?.call(
            u.name,
          ) ??
          orElse(),
      b: (u) =>
          b?.call(
            u.name,
          ) ??
          orElse(),
      c: (u) =>
          c?.call(
            u.name,
            u.code,
            u.flag,
          ) ??
          orElse(),
    );
  }

  _$R? mapOrNull<_$R extends Object?>({
    _$ExampleCallback<_$R, _A>? a,
    _$ExampleCallback<_$R, _B>? b,
    _$ExampleCallback<_$R, _C>? c,
  }) {
    return map(
      a: (u) => a?.call(u),
      b: (u) => b?.call(u),
      c: (u) => c?.call(u),
    );
  }

  _$R? whenOrNull<_$R extends Object?>({
    _$R Function<T>(
      T name,
    )?
        a,
    _$R Function<T>(
      String name,
    )?
        b,
    _$R Function<T>(
      String name,
      int code,
      bool flag,
    )?
        c,
  }) {
    return map(
      a: (u) => a?.call(
        u.name,
      ),
      b: (u) => b?.call(
        u.name,
      ),
      c: (u) => c?.call(
        u.name,
        u.code,
        u.flag,
      ),
    );
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    switch (runtimeType) {
      case _A:
        return (this as _A).toJson(includeUnionType: includeUnionType);
      case _B:
        return (this as _B).toJson(includeUnionType: includeUnionType);
      case _C:
        return (this as _C).toJson(includeUnionType: includeUnionType);
      default:
        throw FallThroughError();
    }
  }

  _A get asA {
    if (!isA) {
      throw Exception('Example runtimeType is not of type _A');
    }
    return this as _A;
  }

  _B get asB {
    if (!isB) {
      throw Exception('Example runtimeType is not of type _B');
    }
    return this as _B;
  }

  _C get asC {
    if (!isC) {
      throw Exception('Example runtimeType is not of type _C');
    }
    return this as _C;
  }

  bool get isA => this is _A;
  bool get isB => this is _B;
  bool get isC => this is _C;
}
Example<T> _$ExampleFromJson<T>(Map<String, dynamic> json,
    [Example? defaultValue]) {
  switch (json[r'$unionType'] as String?) {
    case r'_A':
      return _A.fromJson(json);
    case r'_B':
      return _B.fromJson(json);
    case r'_C':
      return _C.fromJson(json);
    default:
      if (defaultValue != null) {
        return defaultValue as Example<T>;
      }
      throw FallThroughError();
  }
}

const _$sentinelValue = Object();

abstract class _ACopyWith<T> {
  const factory _ACopyWith(_A<T> value) = _ACopyWithImpl<T>;
  _A call({T name});
}

class _ACopyWithImpl<T> implements _ACopyWith<T> {
  const _ACopyWithImpl(this._value);
  final _A<T> _value;
  _A call({
    Object? name = _$sentinelValue,
  }) {
    return _A<T>(name == _$sentinelValue ? _value.name as T : name as T);
  }
}

abstract class _BCopyWith<T> {
  const factory _BCopyWith(_B<T> value) = _BCopyWithImpl<T>;
  _B call({String name});
}

class _BCopyWithImpl<T> implements _BCopyWith<T> {
  const _BCopyWithImpl(this._value);
  final _B<T> _value;
  _B call({
    Object? name = _$sentinelValue,
  }) {
    return _B<T>(
        name == _$sentinelValue ? _value.name as String : name as String);
  }
}

abstract class _CCopyWith<T> {
  const factory _CCopyWith(_C<T> value) = _CCopyWithImpl<T>;
  _C call({String name, int code, bool flag});
}

class _CCopyWithImpl<T> implements _CCopyWith<T> {
  const _CCopyWithImpl(this._value);
  final _C<T> _value;
  _C call({
    Object? name = _$sentinelValue,
    Object? code = _$sentinelValue,
    Object? flag = _$sentinelValue,
  }) {
    return _C<T>(
        name == _$sentinelValue ? _value.name as String : name as String,
        code == _$sentinelValue ? _value.code as int : code as int,
        flag == _$sentinelValue ? _value.flag as bool : flag as bool);
  }
}

typedef _$ExampleCallback<_$R, _$T extends Example> = _$R Function(_$T);
typedef _$NoExampleCallback<_$R> = _$R Function();
