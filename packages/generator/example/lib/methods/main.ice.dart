// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

extension $ExampleX on Example {
  List<Object?> get _$props {
    return [text, whole, decimal, flag, date, list, map, set, example];
  }

  String _$toString() {
    return r'Example('
        'text: $text, '
        'whole: $whole, '
        'decimal: $decimal, '
        'flag: $flag, '
        'date: $date, '
        'list: $list, '
        'map: $map, '
        'set: $set, '
        'example: $example)';
  }

  _$ExampleCopyWith get copyWith => _$ExampleCopyWith(this);
}

const _$sentinelValue = Object();

abstract class _$ExampleCopyWith {
  const factory _$ExampleCopyWith(Example value) = _$ExampleCopyWithImpl;
  Example call(
      {String? text,
      int? whole,
      double? decimal,
      bool? flag,
      DateTime? date,
      List<String>? list,
      Map<String, String>? map,
      Set<String>? set,
      Example? example});
}

class _$ExampleCopyWithImpl implements _$ExampleCopyWith {
  const _$ExampleCopyWithImpl(this._value);
  final Example _value;
  Example call({
    Object? text = _$sentinelValue,
    Object? whole = _$sentinelValue,
    Object? decimal = _$sentinelValue,
    Object? flag = _$sentinelValue,
    Object? date = _$sentinelValue,
    Object? list = _$sentinelValue,
    Object? map = _$sentinelValue,
    Object? set = _$sentinelValue,
    Object? example = _$sentinelValue,
  }) {
    return Example(
        text:
            text == _$sentinelValue ? _value.text as String? : text as String?,
        whole: whole == _$sentinelValue ? _value.whole as int? : whole as int?,
        decimal: decimal == _$sentinelValue
            ? _value.decimal as double?
            : decimal as double?,
        flag: flag == _$sentinelValue ? _value.flag as bool? : flag as bool?,
        date: date == _$sentinelValue
            ? _value.date as DateTime?
            : date as DateTime?,
        list: list == _$sentinelValue
            ? _value.list as List<String>?
            : list as List<String>?,
        map: map == _$sentinelValue
            ? _value.map as Map<String, String>?
            : map as Map<String, String>?,
        set: set == _$sentinelValue
            ? _value.set as Set<String>?
            : set as Set<String>?,
        example: example == _$sentinelValue
            ? _value.example as Example?
            : example as Example?);
  }
}
