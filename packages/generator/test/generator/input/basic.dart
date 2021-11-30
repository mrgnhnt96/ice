// ignore_for_file: cast_nullable_to_non_nullable, prefer_constructors_over_static_methods

import 'package:copywith_annotation/copywith.dart';

// if only 1 constructor, use that constructor for copywith
// if multiple, use default first, then `._` if available
//
// if default & `._` are not available, throw error
@CopyWith()
class Example {
  const Example._({
    this.text,
    this.whole,
    this.decimal,
    this.flag,
    this.date,
    this.list,
    this.map,
    this.set,
    this.example,
  });

  @CopyWithEntryPoint()
  factory Example.fromJson({
    String? text,
    int? whole,
    double? decimal,
  }) =>
      Example._(
        text: text,
        whole: whole,
        decimal: decimal,
      );

  static Example something() => const Example._();

  final String? text;
  final int? whole;
  final double? decimal;
  final bool? flag;
  final DateTime? date;
  final List<String>? list;
  final Map<String, String>? map;
  final Set<String>? set;
  final Example? example;
}

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
    Object? text = kCopyWithDefault,
    Object? whole = kCopyWithDefault,
    Object? decimal = kCopyWithDefault,
    Object? flag = kCopyWithDefault,
    Object? date = kCopyWithDefault,
    Object? list = kCopyWithDefault,
    Object? map = kCopyWithDefault,
    Object? set = kCopyWithDefault,
    Object? example = kCopyWithDefault,
  }) {
    return Example._(
      text: text == kCopyWithDefault ? this.text : text as String,
      whole: whole == kCopyWithDefault ? this.whole : whole as int,
      decimal: decimal == kCopyWithDefault ? this.decimal : decimal as double,
      flag: flag == kCopyWithDefault ? this.flag : flag as bool,
      date: date == kCopyWithDefault ? this.date : date as DateTime,
      list: list == kCopyWithDefault ? this.list : list as List<String>,
      map: map == kCopyWithDefault ? this.map : map as Map<String, String>,
      set: set == kCopyWithDefault ? this.set : set as Set<String>,
      example: example == kCopyWithDefault ? this.example : example as Example,
    );
  }
}
