// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Example with EquatableMixin {
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
class _A extends Example {
  const _A({
    this.name = 'hello world',
  }) : super._();

  factory _A.fromJson(Map<String, dynamic> json) => _$AFromJson(json);
  const factory _A._$fromJson({String name}) = _A;

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
class _B extends Example {
  const _B([
    this.code = 5,
  ]) : super._();

  factory _B.fromJson(Map<String, dynamic> json) => _$BFromJson(json);
  const factory _B._$fromJson([int code]) = _B;

  final int code;
  _BCopyWith get copyWith => _BCopyWith(this);
  @override
  List<Object?> get props {
    return [code];
  }

  @override
  String toString() {
    return r'Example._B(' 'code: $code)';
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
class _C extends Example {
  const _C([
    this.myClass = const <String>[],
  ]) : super._();

  factory _C.fromJson(Map<String, dynamic> json) => _$CFromJson(json);
  const factory _C._$fromJson([dynamic myClass]) = _C;

  final dynamic myClass;
  _CCopyWith get copyWith => _CCopyWith(this);
  @override
  List<Object?> get props {
    return [myClass];
  }

  @override
  String toString() {
    return r'Example._C(' 'myClass: $myClass)';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$CToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = r'_C';
    }
    return map;
  }
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
class _E extends Example {
  const _E([
    this.myClass = const <String>[],
  ]) : super._();

  factory _E.fromJson(Map<String, dynamic> json) => _$EFromJson(json);
  const factory _E._$fromJson([dynamic myClass]) = _E;

  final dynamic myClass;
  _ECopyWith get copyWith => _ECopyWith(this);
  @override
  List<Object?> get props {
    return [myClass];
  }

  @override
  String toString() {
    return r'Example._E(' 'myClass: $myClass)';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$EToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = r'_E';
    }
    return map;
  }
}

mixin _$ExampleMixin {
  R map<R extends Object?>({
    required _$ExampleCallback<R, _A> a,
    required _$ExampleCallback<R, _B> b,
    required _$ExampleCallback<R, _C> c,
    required _$ExampleCallback<R, _E> e,
  }) {
    switch (runtimeType) {
      case _A:
        return a(this as _A);
      case _B:
        return b(this as _B);
      case _C:
        return c(this as _C);
      case _E:
        return e(this as _E);
      default:
        throw UnsupportedError('Unsupported type: $this');
    }
  }

  R when<R extends Object?>({
    required R Function(
      String name,
    )
        a,
    required R Function(
      int code,
    )
        b,
    required R Function(
      dynamic myClass,
    )
        c,
    required R Function(
      dynamic myClass,
    )
        e,
  }) {
    return map(
      a: (u) => a(
        u.name,
      ),
      b: (u) => b(
        u.code,
      ),
      c: (u) => c(
        u.myClass,
      ),
      e: (u) => e(
        u.myClass,
      ),
    );
  }

  R maybeMap<R extends Object?>({
    _$ExampleCallback<R, _A>? a,
    _$ExampleCallback<R, _B>? b,
    _$ExampleCallback<R, _C>? c,
    _$ExampleCallback<R, _E>? e,
    required _$NoExampleCallback<R> orElse,
  }) {
    return map(
      a: (u) => a?.call(u) ?? orElse(),
      b: (u) => b?.call(u) ?? orElse(),
      c: (u) => c?.call(u) ?? orElse(),
      e: (u) => e?.call(u) ?? orElse(),
    );
  }

  R maybeWhen<R extends Object?>({
    R Function(
      String name,
    )?
        a,
    R Function(
      int code,
    )?
        b,
    R Function(
      dynamic myClass,
    )?
        c,
    R Function(
      dynamic myClass,
    )?
        e,
    required _$NoExampleCallback<R> orElse,
  }) {
    return map(
      a: (u) =>
          a?.call(
            u.name,
          ) ??
          orElse(),
      b: (u) =>
          b?.call(
            u.code,
          ) ??
          orElse(),
      c: (u) =>
          c?.call(
            u.myClass,
          ) ??
          orElse(),
      e: (u) =>
          e?.call(
            u.myClass,
          ) ??
          orElse(),
    );
  }

  R? mapOrNull<R extends Object?>({
    _$ExampleCallback<R, _A>? a,
    _$ExampleCallback<R, _B>? b,
    _$ExampleCallback<R, _C>? c,
    _$ExampleCallback<R, _E>? e,
  }) {
    return map(
      a: (u) => a?.call(u),
      b: (u) => b?.call(u),
      c: (u) => c?.call(u),
      e: (u) => e?.call(u),
    );
  }

  R? whenOrNull<R extends Object?>({
    R Function(
      String name,
    )?
        a,
    R Function(
      int code,
    )?
        b,
    R Function(
      dynamic myClass,
    )?
        c,
    R Function(
      dynamic myClass,
    )?
        e,
  }) {
    return map(
      a: (u) => a?.call(
        u.name,
      ),
      b: (u) => b?.call(
        u.code,
      ),
      c: (u) => c?.call(
        u.myClass,
      ),
      e: (u) => e?.call(
        u.myClass,
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
      case _E:
        return (this as _E).toJson(includeUnionType: includeUnionType);
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

  _E get asE {
    if (!isE) {
      throw Exception('Example runtimeType is not of type _E');
    }
    return this as _E;
  }

  bool get isA => this is _A;
  bool get isB => this is _B;
  bool get isC => this is _C;
  bool get isE => this is _E;
}
Example _$ExampleFromJson(Map<String, dynamic> json, [Example? defaultValue]) {
  switch (json[r'$unionType'] as String?) {
    case r'_A':
      return _A.fromJson(json);
    case r'_B':
      return _B.fromJson(json);
    case r'_C':
      return _C.fromJson(json);
    case r'_E':
      return _E.fromJson(json);
    default:
      if (defaultValue != null) {
        return defaultValue;
      }
      throw FallThroughError();
  }
}

const _$sentinelValue = Object();

abstract class _ACopyWith {
  const factory _ACopyWith(_A value) = _ACopyWithImpl;
  _A call({String name});
}

class _ACopyWithImpl implements _ACopyWith {
  const _ACopyWithImpl(this._value);
  final _A _value;
  _A call({
    Object? name = _$sentinelValue,
  }) {
    return _A(name: name == _$sentinelValue ? _value.name : name as String);
  }
}

abstract class _BCopyWith {
  const factory _BCopyWith(_B value) = _BCopyWithImpl;
  _B call({int code});
}

class _BCopyWithImpl implements _BCopyWith {
  const _BCopyWithImpl(this._value);
  final _B _value;
  _B call({
    Object? code = _$sentinelValue,
  }) {
    return _B(code == _$sentinelValue ? _value.code : code as int);
  }
}

abstract class _CCopyWith {
  const factory _CCopyWith(_C value) = _CCopyWithImpl;
  _C call({dynamic myClass});
}

class _CCopyWithImpl implements _CCopyWith {
  const _CCopyWithImpl(this._value);
  final _C _value;
  _C call({
    Object? myClass = _$sentinelValue,
  }) {
    return _C(myClass == _$sentinelValue ? _value.myClass : myClass as dynamic);
  }
}

abstract class _ECopyWith {
  const factory _ECopyWith(_E value) = _ECopyWithImpl;
  _E call({dynamic myClass});
}

class _ECopyWithImpl implements _ECopyWith {
  const _ECopyWithImpl(this._value);
  final _E _value;
  _E call({
    Object? myClass = _$sentinelValue,
  }) {
    return _E(myClass == _$sentinelValue ? _value.myClass : myClass as dynamic);
  }
}

typedef _$ExampleCallback<R, T extends Example> = R Function(T);
typedef _$NoExampleCallback<R> = R Function();
