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
    return 'Example(name: $name)';
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
    return 'Other(name: $name)';
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
    return 'Error()';
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
abstract class _$State
    with EquatableMixin, _$StateMixin
    implements _$StateUnion {
  const _$State();

  factory _$State.fromJson(Map<String, dynamic> json) => _$$StateFromJson(json);
  const factory _$State._$fromJson() = State;

  @override
  List<Object?> get props {
    return [];
  }

  @override
  String toString() {
    return 'State()';
  }
}

class _$StateUnions {
  const _$StateUnions();
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

abstract class _$StateUnion {}

mixin _$StateMixin {
  R map<R extends Object?>({
    required _$StateCallback<R, _$Example> example,
    required _$StateCallback<R, _$Other> other,
    required _$StateCallback<R, _$Error> error,
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

  R when<R extends Object?>({
    required R Function(
      String name,
    )
        example,
    required R Function(
      String name,
    )
        other,
    required R Function() error,
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

  R maybeMap<R extends Object?>({
    _$StateCallback<R, _$Example>? example,
    _$StateCallback<R, _$Other>? other,
    _$StateCallback<R, _$Error>? error,
    required _$NoStateCallback<R> orElse,
  }) {
    return map(
      example: (u) => example?.call(u) ?? orElse(),
      other: (u) => other?.call(u) ?? orElse(),
      error: (u) => error?.call(u) ?? orElse(),
    );
  }

  R maybeWhen<R extends Object?>({
    R Function(
      String name,
    )?
        example,
    R Function(
      String name,
    )?
        other,
    R Function()? error,
    required _$NoStateCallback<R> orElse,
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

  R? mapOrNull<R extends Object?>({
    _$StateCallback<R, _$Example>? example,
    _$StateCallback<R, _$Other>? other,
    _$StateCallback<R, _$Error>? error,
  }) {
    return map(
      example: (u) => example?.call(u),
      other: (u) => other?.call(u),
      error: (u) => error?.call(u),
    );
  }

  R? whenOrNull<R extends Object?>({
    R Function(
      String name,
    )?
        example,
    R Function(
      String name,
    )?
        other,
    R Function()? error,
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

typedef _$StateCallback<R, T extends State> = R Function(T);
typedef _$NoStateCallback<R> = R Function();
