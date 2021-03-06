// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../union_ignore_getters.dart';

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
  const factory _$Example._$fromJson(String name,
      {required int code, required bool flag}) = Example;

  String get name;
  int get code;
  bool get flag;
  String get other;
  _$ExampleCopyWith get copyWith => _$ExampleCopyWith(this);
  @override
  List<Object?> get props {
    return [name, code, flag, other];
  }

  @override
  String toString() {
    return r'State.Example('
        'name: $name, '
        'code: $code, '
        'flag: $flag, '
        'other: $other)';
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    final map = _$$ExampleToJson(this);
    if (includeUnionType) {
      map[r'$unionType'] = r'Example';
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
  factory _$Other._$fromJson() = Other;

  Other copyWith() => Other();
  @override
  List<Object?> get props {
    return [];
  }

  @override
  String toString() {
    return r'State.Other()';
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
abstract class _$State with EquatableMixin, _$StateMixin {
  const _$State();

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
  State example(String name, {required int code, required bool flag}) {
    return Example(name, code: code, flag: flag);
  }

  State other() {
    return Other();
  }
}

mixin _$StateMixin {
  _$R map<_$R extends Object?>({
    required _$StateCallback<_$R, _$Example> example,
    required _$StateCallback<_$R, _$Other> other,
  }) {
    switch (runtimeType) {
      case _$Example:
        return example(this as _$Example);
      case _$Other:
        return other(this as _$Other);
      default:
        throw UnsupportedError('Unsupported type: $this');
    }
  }

  _$R when<_$R extends Object?>({
    required _$R Function(
      String name,
      int code,
      bool flag,
      String other,
    )
        example,
    required _$R Function() other,
  }) {
    return map(
      example: (u) => example.call(
        u.name,
        u.code,
        u.flag,
        u.other,
      ),
      other: (u) => other.call(),
    );
  }

  _$R maybeMap<_$R extends Object?>({
    _$StateCallback<_$R, _$Example>? example,
    _$StateCallback<_$R, _$Other>? other,
    required _$NoStateCallback<_$R> orElse,
  }) {
    return map(
      example: (u) => example?.call(u) ?? orElse(),
      other: (u) => other?.call(u) ?? orElse(),
    );
  }

  _$R maybeWhen<_$R extends Object?>({
    _$R Function(
      String name,
      int code,
      bool flag,
      String other,
    )?
        example,
    _$R Function()? other,
    required _$NoStateCallback<_$R> orElse,
  }) {
    return map(
      example: (u) =>
          example?.call(
            u.name,
            u.code,
            u.flag,
            u.other,
          ) ??
          orElse(),
      other: (u) => other?.call() ?? orElse(),
    );
  }

  _$R? mapOrNull<_$R extends Object?>({
    _$StateCallback<_$R, _$Example>? example,
    _$StateCallback<_$R, _$Other>? other,
  }) {
    return map(
      example: (u) => example?.call(u),
      other: (u) => other?.call(u),
    );
  }

  _$R? whenOrNull<_$R extends Object?>({
    _$R Function(
      String name,
      int code,
      bool flag,
      String other,
    )?
        example,
    _$R Function()? other,
  }) {
    return map(
      example: (u) => example?.call(
        u.name,
        u.code,
        u.flag,
        u.other,
      ),
      other: (u) => other?.call(),
    );
  }

  Map<String, dynamic> toJson({bool includeUnionType = true}) {
    switch (runtimeType) {
      case Example:
        return (this as Example).toJson(includeUnionType: includeUnionType);
      case Other:
        return (this as Other).toJson(includeUnionType: includeUnionType);
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

  bool get isExample => this is Example;
  bool get isOther => this is Other;
}
State _$StateFromJson(Map<String, dynamic> json, [State? defaultValue]) {
  switch (json[r'$unionType'] as String?) {
    case r'Example':
      return _$Example.fromJson(json);
    case r'Other':
      return _$Other.fromJson(json);
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
  Example call({String name, int code, bool flag});
}

class _$ExampleCopyWithImpl implements _$ExampleCopyWith {
  const _$ExampleCopyWithImpl(this._value);
  final _$Example _value;
  Example call({
    Object? name = _$sentinelValue,
    Object? code = _$sentinelValue,
    Object? flag = _$sentinelValue,
  }) {
    return Example(
        name == _$sentinelValue ? _value.name as String : name as String,
        code: code == _$sentinelValue ? _value.code as int : code as int,
        flag: flag == _$sentinelValue ? _value.flag as bool : flag as bool);
  }
}

typedef _$StateCallback<_$R, _$T extends State> = _$R Function(_$T);
typedef _$NoStateCallback<_$R> = _$R Function();
