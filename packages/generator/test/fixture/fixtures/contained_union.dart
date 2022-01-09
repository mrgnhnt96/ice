// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../contained_union.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Example with _$ExampleMixin, EquatableMixin {
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
class A extends Example {
  const A(
    this.name,
  ) : super._();

  factory A.fromJson(Map<String, dynamic> json) => _$AFromJson(json);
  const factory A._$fromJson(String name) = A;

  final String name;
  _ACopyWith get copyWith => _ACopyWith(this);
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
class B extends Example {
  const B(
    this.name,
  ) : super._();

  factory B.fromJson(Map<String, dynamic> json) => _$BFromJson(json);
  const factory B._$fromJson(String name) = B;

  final String name;
  _BCopyWith get copyWith => _BCopyWith(this);
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
class C extends Example {
  const C(
    this.name,
  ) : super._();

  factory C.fromJson(Map<String, dynamic> json) => _$CFromJson(json);
  const factory C._$fromJson(String name) = C;

  final String name;
  _CCopyWith get copyWith => _CCopyWith(this);
  @override
  List<Object?> get props {
    return [name];
  }

  @override
  String toString() {
    return r'Example._C(' 'name: $name)';
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
    required _$R Function(
      String name,
    )
        a,
    required _$R Function(
      String name,
    )
        b,
    required _$R Function(
      String name,
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
    _$R Function(
      String name,
    )?
        a,
    _$R Function(
      String name,
    )?
        b,
    _$R Function(
      String name,
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
    _$R Function(
      String name,
    )?
        a,
    _$R Function(
      String name,
    )?
        b,
    _$R Function(
      String name,
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
      throw Exception('Example runtimeType is not of type _A');
    }
    return this as A;
  }

  B get asB {
    if (!isB) {
      throw Exception('Example runtimeType is not of type _B');
    }
    return this as B;
  }

  C get asC {
    if (!isC) {
      throw Exception('Example runtimeType is not of type _C');
    }
    return this as C;
  }

  bool get isA => this is A;
  bool get isB => this is B;
  bool get isC => this is C;
}
Example _$ExampleFromJson(Map<String, dynamic> json, [Example? defaultValue]) {
  switch (json[r'$unionType'] as String?) {
    case r'_A':
      return A.fromJson(json);
    case r'_B':
      return B.fromJson(json);
    case r'_C':
      return C.fromJson(json);
    default:
      if (defaultValue != null) {
        return defaultValue;
      }
      throw FallThroughError();
  }
}

const _$sentinelValue = Object();

abstract class _ACopyWith {
  const factory _ACopyWith(A value) = _ACopyWithImpl;
  A call({String name});
}

class _ACopyWithImpl implements _ACopyWith {
  const _ACopyWithImpl(this._value);
  final A _value;
  A call({
    Object? name = _$sentinelValue,
  }) {
    return A(name == _$sentinelValue ? _value.name as String : name as String);
  }
}

abstract class _BCopyWith {
  const factory _BCopyWith(B value) = _BCopyWithImpl;
  B call({String name});
}

class _BCopyWithImpl implements _BCopyWith {
  const _BCopyWithImpl(this._value);
  final B _value;
  B call({
    Object? name = _$sentinelValue,
  }) {
    return B(name == _$sentinelValue ? _value.name as String : name as String);
  }
}

abstract class _CCopyWith {
  const factory _CCopyWith(C value) = _CCopyWithImpl;
  C call({String name});
}

class _CCopyWithImpl implements _CCopyWith {
  const _CCopyWithImpl(this._value);
  final C _value;
  C call({
    Object? name = _$sentinelValue,
  }) {
    return C(name == _$sentinelValue ? _value.name as String : name as String);
  }
}

typedef _$ExampleCallback<_$R, _$T extends Example> = _$R Function(_$T);
typedef _$NoExampleCallback<_$R> = _$R Function();
