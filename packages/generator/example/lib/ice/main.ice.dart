// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$Example extends State {
  const _$Example(int code) : super(code);
  const _$Example.empty() : super.empty();

  String? get text;
  int? get whole;
  double? get decimal;
  bool? get flag;
  DateTime? get date;
  List<String>? get list;
  Set<String>? get set;
  Example? get example;

  /// if `null` is passed within the `copyWith` method,
  /// `null` will be returned.
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  Example copyWith({
    _$CopyCallback<String?>? text,
    _$CopyCallback<int?>? whole,
    _$CopyCallback<double?>? decimal,
    _$CopyCallback<bool?>? flag,
    _$CopyCallback<DateTime?>? date,
    _$CopyCallback<List<String>?>? list,
    _$CopyCallback<Set<String>?>? set,
    _$CopyCallback<Example?>? example,
  }) {
    return Example(
        text: text == null ? this.text : text(this.text),
        whole: whole == null ? this.whole : whole(this.whole),
        decimal: decimal == null ? this.decimal : decimal(this.decimal),
        flag: flag == null ? this.flag : flag(this.flag),
        date: date == null ? this.date : date(this.date),
        list: list == null ? this.list : list(this.list),
        set: set == null ? this.set : set(this.set),
        example: example == null ? this.example : example(this.example));
  }

  @override
  List<Object?> get props {
    return [text, whole, decimal, flag, date, list, set, example, code];
  }

  @override
  String toString() {
    return '''
Example(
	text: $text,
	whole: $whole,
	decimal: $decimal,
	flag: $flag,
	date: $date,
	list: $list,
	set: $set,
	example: $example,
)''';
  }

  @override
  String get $StateType => 'Example';
}

extension _$ExampleX on Example {
  Map<String, dynamic> toJson() => _$ExampleToJson(this);
}

abstract class _$Other extends State {
  const _$Other(int code) : super(code);
  const _$Other.empty() : super.empty();

  /// If `null` is passed within the `copyWith` method,
  /// the current value will be returned.
  ///
  /// ```dart
  /// myClass.copyWith(field: newValue);
  /// ```
  Other copyWith({int? code}) {
    return Other(code ?? this.code);
  }

  @override
  List<Object?> get props {
    return [code];
  }

  @override
  String toString() {
    return 'Other()';
  }

  @override
  String get $StateType => 'Other';
}

abstract class _$Error extends State {
  const _$Error(int code) : super(code);
  const _$Error.empty() : super.empty();

  @override
  String get $StateType => 'Error';
}

abstract class _$State with EquatableMixin, _$StateMixin implements $State {
  const _$State();

  int get code;
  @override
  List<Object?> get props {
    return [code];
  }

  @override
  String toString() {
    return '''
State(
	code: $code,
)''';
  }

  @override
  String get $StateType => 'State';
}

typedef _$CopyCallback<T> = T Function(T);
typedef _Result<R, T extends State> = R Function(T);
typedef _NoResult<R> = R Function();

abstract class $State {
  const $State();

  String get $StateType;
}

mixin _$StateMixin {
  R map<R extends Object?>({
    required _Result<R, _$Example> example,
    required _Result<R, _$Other> other,
    required _Result<R, _$Error> error,
  }) {
    switch (this.runtimeType) {
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
      String? text,
      int? whole,
      double? decimal,
      bool? flag,
      DateTime? date,
      List<String>? list,
      Set<String>? set,
      Example? example,
    )
        example,
    required R Function() other,
    required R Function() error,
  }) {
    return map(
        example: (u) => example(
              u.text,
              u.whole,
              u.decimal,
              u.flag,
              u.date,
              u.list,
              u.set,
              u.example,
            ),
        other: (u) => other(),
        error: (u) => error());
  }

  R maybeMap<R extends Object?>({
    _Result<R, _$Example>? example,
    _Result<R, _$Other>? other,
    _Result<R, _$Error>? error,
    required _NoResult<R> orElse,
  }) {
    return map(
        example: (u) => example?.call(u) ?? orElse(),
        other: (u) => other?.call(u) ?? orElse(),
        error: (u) => error?.call(u) ?? orElse());
  }

  R maybeWhen<R extends Object?>({
    R Function(
      String? text,
      int? whole,
      double? decimal,
      bool? flag,
      DateTime? date,
      List<String>? list,
      Set<String>? set,
      Example? example,
    )?
        example,
    R Function()? other,
    R Function()? error,
    required _NoResult<R> orElse,
  }) {
    return map(
        example: (u) =>
            example?.call(
              u.text,
              u.whole,
              u.decimal,
              u.flag,
              u.date,
              u.list,
              u.set,
              u.example,
            ) ??
            orElse(),
        other: (u) => other?.call() ?? orElse(),
        error: (u) => error?.call() ?? orElse());
  }

  R? mapOrNull<R extends Object?>({
    _Result<R, _$Example>? example,
    _Result<R, _$Other>? other,
    _Result<R, _$Error>? error,
  }) {
    return map(
        example: (u) => example?.call(u),
        other: (u) => other?.call(u),
        error: (u) => error?.call(u));
  }

  R? whenOrNull<R extends Object?>({
    R Function(
      String? text,
      int? whole,
      double? decimal,
      bool? flag,
      DateTime? date,
      List<String>? list,
      Set<String>? set,
      Example? example,
    )?
        example,
    R Function()? other,
    R Function()? error,
  }) {
    return map(
        example: (u) => example?.call(
              u.text,
              u.whole,
              u.decimal,
              u.flag,
              u.date,
              u.list,
              u.set,
              u.example,
            ),
        other: (u) => other?.call(),
        error: (u) => error?.call());
  }

  bool get isExample => this is _$Example;
  bool get isOther => this is _$Other;
  bool get isError => this is _$Error;
}
