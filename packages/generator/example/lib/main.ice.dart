// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

extension ExampleX on Example {
  Example copyWith({
    String? text,
    int? whole,
    double? decimal,
    bool? flag,
    DateTime? date,
    List<String>? list,
    Map<String, String>? map,
    Set<String>? set,
    Example? example,
  }) {
    return _copyWith(
      text: text,
      whole: whole,
      decimal: decimal,
      flag: flag,
      date: date,
      list: list,
      map: map,
      set: set,
      example: example,
    );
  }

  Example _copyWith({
    Object? text,
    Object? whole,
    Object? decimal,
    Object? flag,
    Object? date,
    Object? list,
    Object? map,
    Object? set,
    Object? example,
  }) {
    return Example._(
      text: text == kCopyWithDefault ? this.text : text as String?,
      whole: whole == kCopyWithDefault ? this.whole : whole as int?,
      decimal: decimal == kCopyWithDefault ? this.decimal : decimal as double?,
      flag: flag == kCopyWithDefault ? this.flag : flag as bool?,
      date: date == kCopyWithDefault ? this.date : date as DateTime?,
      list: list == kCopyWithDefault ? this.list : list as List<String>?,
      map: map == kCopyWithDefault ? this.map : map as Map<String, String>?,
      set: set == kCopyWithDefault ? this.set : set as Set<String>?,
      example: example == kCopyWithDefault ? this.example : example as Example?,
    );
  }
}
