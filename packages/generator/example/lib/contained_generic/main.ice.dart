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
abstract class _$MyClass with EquatableMixin {
  const _$MyClass();

  const factory _$MyClass._$fromJson() = MyClass;

  MyClass copyWith() => MyClass();
  @override
  List<Object?> get props {
    return [];
  }

  @override
  String toString() {
    return r'MyClass()';
  }

  Map<String, dynamic> toJson() => _$$MyClassToJson(this);
}

MyClass _$MyClassFromJson(Map<String, dynamic> json) {
  return _$$MyClassFromJson(json) as MyClass;
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Example<T, R extends Object>
    with _$ExampleMixin, EquatableMixin {
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
class _A<T, R extends Object> extends Example<T, R> {
  const _A({
    this.name = 'hello world',
  }) : super._();

  factory _A.fromJson(Map<String, dynamic> json) => _$AFromJson(json);
  const factory _A._$fromJson({String name}) = _A;

  @TConv()
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
class _B<T, R extends Object> extends Example<T, R> {
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
class _C<T, R extends Object> extends Example<T, R> {
  const _C([
    this.value = const <String>[],
  ]) : super._();

  factory _C.fromJson(Map<String, dynamic> json) => _$CFromJson(json);
  const factory _C._$fromJson([dynamic value]) = _C;

  final dynamic value;
  _CCopyWith get copyWith => _CCopyWith(this);
  @override
  List<Object?> get props {
    return [value];
  }

  @override
  String toString() {
    return r'Example._C(' 'value: $value)';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$CToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = r'_C';
    }
    return map;
  }
}

mixin _$ExampleMixin<T, R extends Object> {
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
      int code,
    )
        b,
    required _$R Function(
      dynamic value,
    )
        c,
  }) {
    return map(
      a: (u) => a(
        u.name,
      ),
      b: (u) => b(
        u.code,
      ),
      c: (u) => c(
        u.value,
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
      int code,
    )?
        b,
    _$R Function(
      dynamic value,
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
      int code,
    )?
        b,
    _$R Function(
      dynamic value,
    )?
        c,
  }) {
    return map(
      a: (u) => a?.call(
        u.name,
      ),
      b: (u) => b?.call(
        u.code,
      ),
      c: (u) => c?.call(
        u.value,
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
Example<T, R> _$ExampleFromJson<T, R extends Object>(Map<String, dynamic> json,
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
        return defaultValue as Example<T, R>;
      }
      throw FallThroughError();
  }
}

const _$sentinelValue = Object();

abstract class _ACopyWith<T, R extends Object> {
  const factory _ACopyWith(_A value) = _ACopyWithImpl<T, R>;
  _A call({String name});
}

class _ACopyWithImpl<T, R extends Object> implements _ACopyWith<T, R> {
  const _ACopyWithImpl(this._value);
  final _A _value;
  _A call({
    Object? name = _$sentinelValue,
  }) {
    return _A(name: name == _$sentinelValue ? _value.name : name as String);
  }
}

abstract class _BCopyWith<T, R extends Object> {
  const factory _BCopyWith(_B value) = _BCopyWithImpl<T, R>;
  _B call({int code});
}

class _BCopyWithImpl<T, R extends Object> implements _BCopyWith<T, R> {
  const _BCopyWithImpl(this._value);
  final _B _value;
  _B call({
    Object? code = _$sentinelValue,
  }) {
    return _B(code == _$sentinelValue ? _value.code : code as int);
  }
}

abstract class _CCopyWith<T, R extends Object> {
  const factory _CCopyWith(_C value) = _CCopyWithImpl<T, R>;
  _C call({dynamic value});
}

class _CCopyWithImpl<T, R extends Object> implements _CCopyWith<T, R> {
  const _CCopyWithImpl(this._value);
  final _C _value;
  _C call({
    Object? value = _$sentinelValue,
  }) {
    return _C(value == _$sentinelValue ? _value.value : value as dynamic);
  }
}

typedef _$ExampleCallback<_$R, _$T extends Example> = _$R Function(_$T);
typedef _$NoExampleCallback<_$R> = _$R Function();
