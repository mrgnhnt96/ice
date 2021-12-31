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
  const _$Example(int code) : super(code);
  const _$Example.empty() : super.empty();
  const factory _$Example._$fromJson(
      {String? text,
      int? whole,
      double? decimal,
      bool? flag,
      DateTime? date,
      List<String>? list,
      Set<String>? set}) = Example;

  String? get text;
  int? get whole;
  double? get decimal;
  bool? get flag;
  DateTime? get date;
  List<String>? get list;
  Set<String>? get set;
  _$ExampleCopyWith get copyWith => _$ExampleCopyWith(this);
  @override
  List<Object?> get props {
    return [text, whole, decimal, flag, date, list, set, code];
  }

  @override
  String toString() {
    return 'Example(text: $text, whole: $whole, decimal: $decimal, flag: $flag, date: $date, list: $list, set: $set)';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$$ExampleToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = r'Example';
    }
    return map;
  }
}

Example _$ExampleFromJson(Map<String, dynamic> json) {
  return _$$ExampleFromJson(json) as Example;
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Other extends State {
  const _$Other(int code) : super(code);
  const _$Other.empty() : super.empty();
  factory _$Other.fromJson(Map<String, dynamic> json) => _$$OtherFromJson(json);
  const factory _$Other._$fromJson(int code) = Other;

  _$OtherCopyWith get copyWith => _$OtherCopyWith(this);
  @override
  List<Object?> get props {
    return [code];
  }

  @override
  String toString() {
    return 'Other()';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$$OtherToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = r'Other';
    }
    return map;
  }
}

@JsonSerializable(
  constructor: r'_$fromJson',
)
abstract class _$Error extends State {
  const _$Error(int code) : super(code);
  const _$Error.empty() : super.empty();
  factory _$Error.fromJson(Map<String, dynamic> json) => _$$ErrorFromJson(json);
  const factory _$Error._$fromJson(int code) = Error;

  _$ErrorCopyWith get copyWith => _$ErrorCopyWith(this);
  @override
  List<Object?> get props {
    return [code];
  }

  @override
  String toString() {
    return 'Error()';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$$ErrorToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = r'Error';
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
  const factory _$State._$fromJson(int code) = State;

  int get code;

  @override
  List<Object?> get props {
    return [code];
  }

  @override
  String toString() {
    return 'State(code: $code)';
  }
}

class _$StateUnions {
  const _$StateUnions();
  State example(
      {String? text,
      int? whole,
      double? decimal,
      bool? flag,
      DateTime? date,
      List<String>? list,
      Set<String>? set}) {
    return Example(
        text: text,
        whole: whole,
        decimal: decimal,
        flag: flag,
        date: date,
        list: list,
        set: set);
  }

  State other(int code) {
    return Other(code);
  }

  State error(int code) {
    return Error(code);
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
  switch (json[r'$unionType'] as String?) {
    case r'Example':
      return Example.fromJson(json);
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
  Example call(
      {String? text,
      int? whole,
      double? decimal,
      bool? flag,
      DateTime? date,
      List<String>? list,
      Set<String>? set});
}

class _$ExampleCopyWithImpl implements _$ExampleCopyWith {
  const _$ExampleCopyWithImpl(this._value);
  final _$Example _value;
  Example call({
    Object? text = _$sentinelValue,
    Object? whole = _$sentinelValue,
    Object? decimal = _$sentinelValue,
    Object? flag = _$sentinelValue,
    Object? date = _$sentinelValue,
    Object? list = _$sentinelValue,
    Object? set = _$sentinelValue,
  }) {
    return Example(
        text: text == _$sentinelValue ? _value.text : text as String?,
        whole: whole == _$sentinelValue ? _value.whole : whole as int?,
        decimal:
            decimal == _$sentinelValue ? _value.decimal : decimal as double?,
        flag: flag == _$sentinelValue ? _value.flag : flag as bool?,
        date: date == _$sentinelValue ? _value.date : date as DateTime?,
        list: list == _$sentinelValue ? _value.list : list as List<String>?,
        set: set == _$sentinelValue ? _value.set : set as Set<String>?);
  }
}

abstract class _$OtherCopyWith {
  const factory _$OtherCopyWith(_$Other value) = _$OtherCopyWithImpl;
  Other call({int code});
}

class _$OtherCopyWithImpl implements _$OtherCopyWith {
  const _$OtherCopyWithImpl(this._value);
  final _$Other _value;
  Other call({
    Object? code = _$sentinelValue,
  }) {
    return Other(code == _$sentinelValue ? _value.code : code as int);
  }
}

abstract class _$ErrorCopyWith {
  const factory _$ErrorCopyWith(_$Error value) = _$ErrorCopyWithImpl;
  Error call({int code});
}

class _$ErrorCopyWithImpl implements _$ErrorCopyWith {
  const _$ErrorCopyWithImpl(this._value);
  final _$Error _value;
  Error call({
    Object? code = _$sentinelValue,
  }) {
    return Error(code == _$sentinelValue ? _value.code : code as int);
  }
}

typedef _$StateCallback<R, T extends State> = R Function(T);
typedef _$NoStateCallback<R> = R Function();
