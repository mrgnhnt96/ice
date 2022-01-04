part of '../contained.dart';

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$MyClass {
  const _$MyClass();
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Example<T, R extends Object> {
  const _$Example();
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
class _A<T, R extends Object> extends Example<T, R> {
  const _A({this.name = 'hello world' as T}) : super._();

  final T name;
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
class _B<T, R extends Object> extends Example<T, R> {
  const _B([
    this.code = 5,
  ]) : super._();

  final int code;
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
class _C<T, R extends Object> extends Example<T, R> {
  const _C([
    this.value = const <String>[],
  ]) : super._();

  final dynamic value;
}

mixin _$ExampleMixin<T, R extends Object> {
  $R map<$R extends Object?>({
    required _$ExampleCallback<$R, _A> a,
    required _$ExampleCallback<$R, _B> b,
    required _$ExampleCallback<$R, _C> c,
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

  $R when<$R extends Object?>({
    required $R Function(
      T name,
    )
        a,
    required $R Function(
      int code,
    )
        b,
    required $R Function(
      dynamic value,
    )
        c,
  }) {
    return map(
      a: (u) => a(
        u.name as T,
      ),
      b: (u) => b(
        u.code,
      ),
      c: (u) => c(
        u.value,
      ),
    );
  }

  $R maybeMap<$R extends Object?>({
    _$ExampleCallback<$R, _A>? a,
    _$ExampleCallback<$R, _B>? b,
    _$ExampleCallback<$R, _C>? c,
    required _$NoExampleCallback<$R> orElse,
  }) {
    return map(
      a: (u) => a?.call(u) ?? orElse(),
      b: (u) => b?.call(u) ?? orElse(),
      c: (u) => c?.call(u) ?? orElse(),
    );
  }

  $R maybeWhen<$R extends Object?>({
    $R Function(
      T name,
    )?
        a,
    $R Function(
      int code,
    )?
        b,
    $R Function(
      dynamic value,
    )?
        c,
    required _$NoExampleCallback<$R> orElse,
  }) {
    return map(
      a: (u) =>
          a?.call(
            u.name as T,
          ) ??
          orElse(),
      b: (u) =>
          b?.call(
            u.code,
          ) ??
          orElse(),
      c: (u) =>
          c?.call(
            u.value,
          ) ??
          orElse(),
    );
  }

  $R? mapOrNull<$R extends Object?>({
    _$ExampleCallback<$R, _A>? a,
    _$ExampleCallback<$R, _B>? b,
    _$ExampleCallback<$R, _C>? c,
  }) {
    return map(
      a: (u) => a?.call(u),
      b: (u) => b?.call(u),
      c: (u) => c?.call(u),
    );
  }

  $R? whenOrNull<$R extends Object?>({
    $R Function(
      T name,
    )?
        a,
    $R Function(
      int code,
    )?
        b,
    $R Function(
      dynamic value,
    )?
        c,
  }) {
    return map(
      a: (u) => a?.call(
        u.name as T,
      ),
      b: (u) => b?.call(
        u.code,
      ),
      c: (u) => c?.call(
        u.value,
      ),
    );
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

typedef _$ExampleCallback<$R, $T extends Example<dynamic, dynamic>> = $R
    Function($T);
typedef _$NoExampleCallback<$R> = $R Function();
