// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$Example with _$ExampleMixin {
  const _$Example();
}

class A extends Example {
  const A(
    this.name,
  ) : super._();

  final String name;
}

class B extends Example {
  const B(
    this.name,
  ) : super._();

  final String name;
}

class C extends Example {
  const C(
    this.name,
    this.code,
    this.flag,
  ) : super._();

  final String name;
  final int code;
  final bool flag;
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
typedef _$ExampleCallback<_$R, _$T extends Example> = _$R Function(_$T);
typedef _$NoExampleCallback<_$R> = _$R Function();
