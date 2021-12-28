// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

@JsonSerializable(
  constructor: '_',
)
abstract class _$Example extends State {
  const _$Example() : super();

  const factory _$Example._(
    String name,
  ) = Example;
  factory _$Example.fromJson(Map<String, dynamic> json) =>
      _$$ExampleFromJson(json);

  String get name;

  /// If `null` is passed within the `copyWith` method,
  /// the current value will be returned.
  ///
  /// ```dart
  /// myClass.copyWith(field: newValue);
  /// ```
  Example copyWith({
    String? name,
  }) {
    return Example(name ?? this.name);
  }

  @override
  List<Object?> get props {
    return [name];
  }

  @override
  String toString() {
    return '''
Example(
	name: $name,
)''';
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
  constructor: '_',
)
abstract class _$Other extends State {
  const _$Other() : super();

  const factory _$Other._(
    String name,
  ) = Other;
  factory _$Other.fromJson(Map<String, dynamic> json) => _$$OtherFromJson(json);

  String get name;

  /// If `null` is passed within the `copyWith` method,
  /// the current value will be returned.
  ///
  /// ```dart
  /// myClass.copyWith(field: newValue);
  /// ```
  Other copyWith({
    String? name,
  }) {
    return Other(name ?? this.name);
  }

  @override
  List<Object?> get props {
    return [name];
  }

  @override
  String toString() {
    return '''
Other(
	name: $name,
)''';
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
  constructor: '_',
)
abstract class _$Error extends State {
  const _$Error() : super();

  const factory _$Error._() = Error;
  factory _$Error.fromJson(Map<String, dynamic> json) => _$$ErrorFromJson(json);

  /// If `null` is passed within the `copyWith` method,
  /// the current value will be returned.
  ///
  /// ```dart
  /// myClass.copyWith(field: newValue);
  /// ```
  Error copyWith() {
    return Error();
  }

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
  constructor: '_',
)
abstract class _$State
    with EquatableMixin, _$StateMixin
    implements _$StateUnion {
  const _$State();

  const factory _$State._() = State;
  factory _$State.fromJson(Map<String, dynamic> json) => _$$StateFromJson(json);

  @override
  List<Object?> get props {
    return [];
  }

  @override
  String toString() {
    return 'State()';
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

  bool get isExample => this is _$Example;
  bool get isOther => this is _$Other;
  bool get isError => this is _$Error;
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

typedef _$StateCallback<R, T extends State> = R Function(T);
typedef _$NoStateCallback<R> = R Function();
