// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$Example extends State {
  _$Example() : super();

  String get name;

  /// if `null` is passed within the `copyWith` method,
  /// `null` will be returned.
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  Example copyWith({
    _$CopyCallback<String>? name,
  }) {
    return Example(name == null ? this.name : name(this.name));
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

  @override
  String get $StateType => 'Example';
}

extension $ExampleX on Example {
  Map<String, dynamic> toJson() => _$ExampleToJson(this);
}

abstract class _$Other extends State {
  _$Other() : super();

  /// If `null` is passed within the `copyWith` method,
  /// the current value will be returned.
  ///
  /// ```dart
  /// myClass.copyWith(field: newValue);
  /// ```
  Other copyWith() {
    return Other();
  }

  @override
  List<Object?> get props {
    return [];
  }

  @override
  String toString() {
    return 'Other()';
  }

  @override
  String get $StateType => 'Other';
}

abstract class _$Error extends State {
  _$Error() : super();

  @override
  String get $StateType => 'Error';
}

abstract class _$State
    with EquatableMixin, _$StateMixin
    implements _$StateUnion {
  const _$State();

  @override
  List<Object?> get props {
    return [];
  }

  @override
  String toString() {
    return 'State()';
  }

  @override
  String get $StateType => 'State';
}

abstract class _$StateUnion {
  const _$StateUnion();

  String get $StateType;
}

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
    required R Function() other,
    required R Function() error,
  }) {
    return map(
      example: (u) => example(
        u.name,
      ),
      other: (u) => other(),
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
    R Function()? other,
    R Function()? error,
    required _$NoStateCallback<R> orElse,
  }) {
    return map(
      example: (u) =>
          example?.call(
            u.name,
          ) ??
          orElse(),
      other: (u) => other?.call() ?? orElse(),
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
    R Function()? other,
    R Function()? error,
  }) {
    return map(
      example: (u) => example?.call(
        u.name,
      ),
      other: (u) => other?.call(),
      error: (u) => error?.call(),
    );
  }

  bool get isExample => this is _$Example;
  bool get isOther => this is _$Other;
  bool get isError => this is _$Error;
}

typedef _$CopyCallback<T> = T Function(T);
typedef _$StateCallback<R, T extends State> = R Function(T);
typedef _$NoStateCallback<R> = R Function();
