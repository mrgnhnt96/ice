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
abstract class _$Example extends State {
  const _$Example() : super();
  factory _$Example.fromJson(Map<String, dynamic> json) =>
      _$$ExampleFromJson(json);
  const factory _$Example._$fromJson(String name) = Example;

  String get name;
  _$ExampleCopyWith get copyWith => _$ExampleCopyWith(this);
  @override
  List<Object?> get props {
    return [name];
  }

  @override
  String toString() {
    return r'State.Example(' 'name: $name)';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$$ExampleToJson(this);
    if (includeUnionType) {
      map[r'runtimeType'] = r'$Something';
    }
    return map;
  }
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Other extends State {
  const _$Other() : super();
  factory _$Other.fromJson(Map<String, dynamic> json) => _$$OtherFromJson(json);
  const factory _$Other._$fromJson(String name) = Other;

  String get name;
  _$OtherCopyWith get copyWith => _$OtherCopyWith(this);
  @override
  List<Object?> get props {
    return [name];
  }

  @override
  String toString() {
    return r'State.Other(' 'name: $name)';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$$OtherToJson(this);
    if (includeUnionType) {
      map[r'runtimeType'] = r'Other';
    }
    return map;
  }
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Error extends State {
  const _$Error() : super();
  factory _$Error.fromJson(Map<String, dynamic> json) => _$$ErrorFromJson(json);
  const factory _$Error._$fromJson() = Error;

  Error copyWith() => Error();
  @override
  List<Object?> get props {
    return [];
  }

  @override
  String toString() {
    return r'State.Error()';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$$ErrorToJson(this);
    if (includeUnionType) {
      map[r'runtimeType'] = r'Error';
    }
    return map;
  }
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$State with EquatableMixin, _$StateMixin {
  const _$State();

  factory _$State.fromJson(Map<String, dynamic> json) => _$$StateFromJson(json);
  const factory _$State._$fromJson() = State;

  @override
  List<Object?> get props {
    return [];
  }

  @override
  String toString() {
    return r'State()';
  }
}

class _$StateTearOffs {
  const _$StateTearOffs();
  State example(String name) {
    return Example(name);
  }

  State other(String name) {
    return Other(name);
  }

  State error() {
    return Error();
  }
}

mixin _$StateMixin {
  _$R map<_$R extends Object?>({
    required _$StateCallback<_$R, _$Example> example,
    required _$StateCallback<_$R, _$Other> other,
    required _$StateCallback<_$R, _$Error> error,
  }) {
    switch (runtimeType) {
      case _$Example:
        return example(this as _$Example);
      case _$Other:
        return other(this as _$Other);
      case _$Error:
        return error(this as _$Error);
      default:
        throw UnsupportedError('Unsupported type: $this');
    }
  }

  _$R when<_$R extends Object?>({
    required _$R Function(
      String name,
    )
        example,
    required _$R Function(
      String name,
    )
        other,
    required _$R Function() error,
  }) {
    return map(
      example: (u) => example(
        u.name,
      ),
      other: (u) => other(
        u.name,
      ),
      error: (u) => error(),
    );
  }

  _$R maybeMap<_$R extends Object?>({
    _$StateCallback<_$R, _$Example>? example,
    _$StateCallback<_$R, _$Other>? other,
    _$StateCallback<_$R, _$Error>? error,
    required _$NoStateCallback<_$R> orElse,
  }) {
    return map(
      example: (u) => example?.call(u) ?? orElse(),
      other: (u) => other?.call(u) ?? orElse(),
      error: (u) => error?.call(u) ?? orElse(),
    );
  }

  _$R maybeWhen<_$R extends Object?>({
    _$R Function(
      String name,
    )?
        example,
    _$R Function(
      String name,
    )?
        other,
    _$R Function()? error,
    required _$NoStateCallback<_$R> orElse,
  }) {
    return map(
      example: (u) =>
          example?.call(
            u.name,
          ) ??
          orElse(),
      other: (u) =>
          other?.call(
            u.name,
          ) ??
          orElse(),
      error: (u) => error?.call() ?? orElse(),
    );
  }

  _$R? mapOrNull<_$R extends Object?>({
    _$StateCallback<_$R, _$Example>? example,
    _$StateCallback<_$R, _$Other>? other,
    _$StateCallback<_$R, _$Error>? error,
  }) {
    return map(
      example: (u) => example?.call(u),
      other: (u) => other?.call(u),
      error: (u) => error?.call(u),
    );
  }

  _$R? whenOrNull<_$R extends Object?>({
    _$R Function(
      String name,
    )?
        example,
    _$R Function(
      String name,
    )?
        other,
    _$R Function()? error,
  }) {
    return map(
      example: (u) => example?.call(
        u.name,
      ),
      other: (u) => other?.call(
        u.name,
      ),
      error: (u) => error?.call(),
    );
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    switch (runtimeType) {
      case Example:
        return (this as Example).toJson(includeUnionType: includeUnionType);
      case Other:
        return (this as Other).toJson(includeUnionType: includeUnionType);
      case Error:
        return (this as Error).toJson(includeUnionType: includeUnionType);
      default:
        throw FallThroughError();
    }
  }

  Example get asExample {
    if (!isExample) {
      throw Exception('State runtimeType is not of type Example');
    }
    return this as Example;
  }

  Other get asOther {
    if (!isOther) {
      throw Exception('State runtimeType is not of type Other');
    }
    return this as Other;
  }

  Error get asError {
    if (!isError) {
      throw Exception('State runtimeType is not of type Error');
    }
    return this as Error;
  }

  bool get isExample => this is Example;
  bool get isOther => this is Other;
  bool get isError => this is Error;
}
State _$StateFromJson(Map<String, dynamic> json, [State? defaultValue]) {
  switch (json[r'runtimeType'] as String?) {
    case r'$Something':
      return _$Example.fromJson(json);
    case r'Other':
      return _$Other.fromJson(json);
    case r'Error':
      return _$Error.fromJson(json);
    default:
      if (defaultValue != null) {
        return defaultValue;
      }
      throw FallThroughError();
  }
}

const _$sentinelValue = Object();

abstract class _$ExampleCopyWith {
  const factory _$ExampleCopyWith(_$Example value) = _$ExampleCopyWithImpl;
  Example call({String name});
}

class _$ExampleCopyWithImpl implements _$ExampleCopyWith {
  const _$ExampleCopyWithImpl(this._value);
  final _$Example _value;
  Example call({
    Object? name = _$sentinelValue,
  }) {
    return Example(name == _$sentinelValue ? _value.name : name as String);
  }
}

abstract class _$OtherCopyWith {
  const factory _$OtherCopyWith(_$Other value) = _$OtherCopyWithImpl;
  Other call({String name});
}

class _$OtherCopyWithImpl implements _$OtherCopyWith {
  const _$OtherCopyWithImpl(this._value);
  final _$Other _value;
  Other call({
    Object? name = _$sentinelValue,
  }) {
    return Other(name == _$sentinelValue ? _value.name : name as String);
  }
}

typedef _$StateCallback<_$R, _$T extends State> = _$R Function(_$T);
typedef _$NoStateCallback<_$R> = _$R Function();
