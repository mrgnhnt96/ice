// ignore_for_file: cast_nullable_to_non_nullable, prefer_constructors_over_static_methods

import 'package:copywith_annotation/copywith.dart';

// if only 1 constructor, use that constructor for copywith
// if multiple, use default first, then `._` if available
//
// if default & `._` are not available, throw error
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
