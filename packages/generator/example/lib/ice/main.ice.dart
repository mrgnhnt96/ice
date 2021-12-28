// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$StateUnion {
  const _$StateUnion();

  String get $unionType;
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
      String? text,
      int? whole,
      double? decimal,
      bool? flag,
      DateTime? date,
      List<String>? list,
      Set<String>? set,
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
      String? text,
      int? whole,
      double? decimal,
      bool? flag,
      DateTime? date,
      List<String>? list,
      Set<String>? set,
    )?
        example,
    R Function()? other,
    R Function()? error,
    required _$NoStateCallback<R> orElse,
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
      String? text,
      int? whole,
      double? decimal,
      bool? flag,
      DateTime? date,
      List<String>? list,
      Set<String>? set,
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
      ),
      other: (u) => other?.call(),
      error: (u) => error?.call(),
    );
  }

  bool get isExample => this is _$Example;
  bool get isOther => this is _$Other;
  bool get isError => this is _$Error;
}
_$StateFromJson(Map<String, dynamic> json) {
  switch (json[r'$unionType'] as String) {
    case 'Example':
      return Example.fromJson(json);
    case 'Other':
      return Other.fromJson(json);
    case 'Error':
      return Error.fromJson(json);
    default:
      throw FallThroughError();
  }
}

@JsonSerializable(
  constructor: '_',
)
abstract class _$Example extends State {
  const factory _$Example._({
    String? text,
    int? whole,
    double? decimal,
    bool? flag,
    DateTime? date,
    List<String>? list,
    Set<String>? set,
  }) = Example;
  const _$Example(int code) : super(code);
  const _$Example.empty() : super.empty();

  String? get text;
  int? get whole;
  double? get decimal;
  bool? get flag;
  DateTime? get date;
  List<String>? get list;
  Set<String>? get set;

  /// If `null` is passed within the `copyWith` method,
  /// the current value will be returned.
  ///
  /// ```dart
  /// myClass.copyWith(field: newValue);
  /// ```
  Example copyWith({
    String? text,
    int? whole,
    double? decimal,
    bool? flag,
    DateTime? date,
    List<String>? list,
    Set<String>? set,
  }) {
    return Example(
        text: text ?? this.text,
        whole: whole ?? this.whole,
        decimal: decimal ?? this.decimal,
        flag: flag ?? this.flag,
        date: date ?? this.date,
        list: list ?? this.list,
        set: set ?? this.set);
  }

  @override
  List<Object?> get props {
    return [text, whole, decimal, flag, date, list, set, code];
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
)''';
  }

  @override
  String get $unionType => 'Example';
}

extension $ExampleX on Example {
  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$$ExampleToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = 'Example';
    }
    return map;
  }
}

Example _$ExampleFromJson(Map<String, dynamic> json) {
  return _$$ExampleFromJson(json) as Example;
}

@JsonSerializable(
  constructor: '_',
)
abstract class _$Other extends State {
  const factory _$Other._(
    int code,
  ) = Other;
  const _$Other(int code) : super(code);
  const _$Other.empty() : super.empty();

  /// If `null` is passed within the `copyWith` method,
  /// the current value will be returned.
  ///
  /// ```dart
  /// myClass.copyWith(field: newValue);
  /// ```
  Other copyWith({
    int? code,
  }) {
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
  String get $unionType => 'Other';
}

extension $OtherX on Other {
  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$$OtherToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = 'Other';
    }
    return map;
  }
}

Other _$OtherFromJson(Map<String, dynamic> json) {
  return _$$OtherFromJson(json) as Other;
}

@JsonSerializable(
  constructor: '_',
)
abstract class _$Error extends State {
  const factory _$Error._(
    int code,
  ) = Error;
  const _$Error(int code) : super(code);
  const _$Error.empty() : super.empty();

  /// If `null` is passed within the `copyWith` method,
  /// the current value will be returned.
  ///
  /// ```dart
  /// myClass.copyWith(field: newValue);
  /// ```
  Error copyWith({
    int? code,
  }) {
    return Error(code ?? this.code);
  }

  @override
  List<Object?> get props {
    return [code];
  }

  @override
  String toString() {
    return 'Error()';
  }

  @override
  String get $unionType => 'Error';
}

extension $ErrorX on Error {
  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$$ErrorToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = 'Error';
    }
    return map;
  }
}

Error _$ErrorFromJson(Map<String, dynamic> json) {
  return _$$ErrorFromJson(json) as Error;
}

@JsonSerializable(
  constructor: '_',
)
abstract class _$State
    with EquatableMixin, _$StateMixin
    implements _$StateUnion {
  const factory _$State._(
    int code,
  ) = State;
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
  String get $unionType => 'State';
}

extension $StateX on State {}

typedef _$StateCallback<R, T extends State> = R Function(T);
typedef _$NoStateCallback<R> = R Function();
