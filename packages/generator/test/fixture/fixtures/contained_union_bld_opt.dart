// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../contained_union.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$Example with _$ExampleMixin {
  const _$Example();

  @override
  String toString() {
    return r'Example()';
  }
}

class A extends Example {
  const A(
    this.name,
  ) : super._();

  final String name;
  ACopyWith get copyWith => ACopyWith(this);

  @override
  String toString() {
    return r'Example.A(' 'name: $name)';
  }
}

class B extends Example {
  const B(
    this.name,
  ) : super._();

  final String name;
  BCopyWith get copyWith => BCopyWith(this);

  @override
  String toString() {
    return r'Example.B(' 'name: $name)';
  }
}

class C extends Example {
  const C(
    this.name,
  ) : super._();

  final String name;
  CCopyWith get copyWith => CCopyWith(this);

  @override
  String toString() {
    return r'Example.C(' 'name: $name)';
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
const _$sentinelValue = Object();

abstract class ACopyWith {
  const factory ACopyWith(A value) = ACopyWithImpl;
  A call({String name});
}

class ACopyWithImpl implements ACopyWith {
  const ACopyWithImpl(this._value);
  final A _value;
  A call({
    Object? name = _$sentinelValue,
  }) {
    return A(name == _$sentinelValue ? _value.name as String : name as String);
  }
}

abstract class BCopyWith {
  const factory BCopyWith(B value) = BCopyWithImpl;
  B call({String name});
}

class BCopyWithImpl implements BCopyWith {
  const BCopyWithImpl(this._value);
  final B _value;
  B call({
    Object? name = _$sentinelValue,
  }) {
    return B(name == _$sentinelValue ? _value.name as String : name as String);
  }
}

abstract class CCopyWith {
  const factory CCopyWith(C value) = CCopyWithImpl;
  C call({String name});
}

class CCopyWithImpl implements CCopyWith {
  const CCopyWithImpl(this._value);
  final C _value;
  C call({
    Object? name = _$sentinelValue,
  }) {
    return C(name == _$sentinelValue ? _value.name as String : name as String);
  }
}

typedef _$ExampleCallback<_$R, _$T extends Example> = _$R Function(_$T);
typedef _$NoExampleCallback<_$R> = _$R Function();
