// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../contained_union_no_methods.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$Example with _$ExampleMixin {
  const _$Example();
}

class _A extends Example {
  const _A(
    this.name,
  ) : super._();

  final String name;
}

class _B extends Example {
  const _B(
    this.name,
  ) : super._();

  final String name;
}

class _C extends Example {
  const _C(
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
typedef _$ExampleCallback<_$R, _$T extends Example> = _$R Function(_$T);
typedef _$NoExampleCallback<_$R> = _$R Function();
