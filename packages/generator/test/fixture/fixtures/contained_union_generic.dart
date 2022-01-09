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
class A<T> extends Example<T> {
  const A(
    this.name,
  ) : super._();

  factory A.fromJson(Map<String, dynamic> json) => _$AFromJson(json);
  const factory A._$fromJson(T name) = A;

  @TConv()
  final T name;
  ACopyWith get copyWith => ACopyWith<T>(this);
  @override
  List<Object?> get props {
    return [name];
  }

  @override
  String toString() {
    return r'Example.A(' 'name: $name)';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$AToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = r'A';
    }
    return map;
  }
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
class B<T> extends Example<T> {
  const B(
    this.name,
  ) : super._();

  factory B.fromJson(Map<String, dynamic> json) => _$BFromJson(json);
  const factory B._$fromJson(String name) = B;

  final String name;
  BCopyWith get copyWith => BCopyWith<T>(this);
  @override
  List<Object?> get props {
    return [name];
  }

  @override
  String toString() {
    return r'Example.B(' 'name: $name)';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$BToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = r'B';
    }
    return map;
  }
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
class C<T> extends Example<T> {
  const C(
    this.name,
    this.code,
    this.flag,
  ) : super._();

  factory C.fromJson(Map<String, dynamic> json) => _$CFromJson(json);
  const factory C._$fromJson(String name, int code, bool flag) = C;

  final String name;
  final int code;
  final bool flag;
  CCopyWith get copyWith => CCopyWith<T>(this);
  @override
  List<Object?> get props {
    return [name, code, flag];
  }

  @override
  String toString() {
    return r'Example.C(' 'name: $name, ' 'code: $code, ' 'flag: $flag)';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$CToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = r'C';
    }
    return map;
  }
}

mixin _$ExampleMixin {
  _$R map<_$R extends Object?>({
    required _$ExampleCallback<_$R, A> a,
    required _$ExampleCallback<_$R, B> b,
    required _$ExampleCallback<_$R, C> c,
  }) {
    switch (runtimeType) {
      case A:
        return a(this as A);
      case B:
        return b(this as B);
      case C:
        return c(this as C);
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
    _$ExampleCallback<_$R, A>? a,
    _$ExampleCallback<_$R, B>? b,
    _$ExampleCallback<_$R, C>? c,
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
    _$ExampleCallback<_$R, A>? a,
    _$ExampleCallback<_$R, B>? b,
    _$ExampleCallback<_$R, C>? c,
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
      case A:
        return (this as A).toJson(includeUnionType: includeUnionType);
      case B:
        return (this as B).toJson(includeUnionType: includeUnionType);
      case C:
        return (this as C).toJson(includeUnionType: includeUnionType);
      default:
        throw FallThroughError();
    }
  }

  A get asA {
    if (!isA) {
      throw Exception('Example runtimeType is not of type A');
    }
    return this as A;
  }

  B get asB {
    if (!isB) {
      throw Exception('Example runtimeType is not of type B');
    }
    return this as B;
  }

  C get asC {
    if (!isC) {
      throw Exception('Example runtimeType is not of type C');
    }
    return this as C;
  }

  bool get isA => this is A;
  bool get isB => this is B;
  bool get isC => this is C;
}
Example<T> _$ExampleFromJson<T>(Map<String, dynamic> json,
    [Example? defaultValue]) {
  switch (json[r'$unionType'] as String?) {
    case r'A':
      return A.fromJson(json);
    case r'B':
      return B.fromJson(json);
    case r'C':
      return C.fromJson(json);
    default:
      if (defaultValue != null) {
        return defaultValue as Example<T>;
      }
      throw FallThroughError();
  }
}

const _$sentinelValue = Object();

abstract class ACopyWith<T> {
  const factory ACopyWith(A<T> value) = ACopyWithImpl<T>;
  A call({T name});
}

class ACopyWithImpl<T> implements ACopyWith<T> {
  const ACopyWithImpl(this._value);
  final A<T> _value;
  A call({
    Object? name = _$sentinelValue,
  }) {
    return A<T>(name == _$sentinelValue ? _value.name as T : name as T);
  }
}

abstract class BCopyWith<T> {
  const factory BCopyWith(B<T> value) = BCopyWithImpl<T>;
  B call({String name});
}

class BCopyWithImpl<T> implements BCopyWith<T> {
  const BCopyWithImpl(this._value);
  final B<T> _value;
  B call({
    Object? name = _$sentinelValue,
  }) {
    return B<T>(
        name == _$sentinelValue ? _value.name as String : name as String);
  }
}

abstract class CCopyWith<T> {
  const factory CCopyWith(C<T> value) = CCopyWithImpl<T>;
  C call({String name, int code, bool flag});
}

class CCopyWithImpl<T> implements CCopyWith<T> {
  const CCopyWithImpl(this._value);
  final C<T> _value;
  C call({
    Object? name = _$sentinelValue,
    Object? code = _$sentinelValue,
    Object? flag = _$sentinelValue,
  }) {
    return C<T>(
        name == _$sentinelValue ? _value.name as String : name as String,
        code == _$sentinelValue ? _value.code as int : code as int,
        flag == _$sentinelValue ? _value.flag as bool : flag as bool);
  }
}

typedef _$ExampleCallback<_$R, _$T extends Example> = _$R Function(_$T);
typedef _$NoExampleCallback<_$R> = _$R Function();
