// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension ExampleX on Example {
  Example copyWith({
    String? text,
    int? whole,
    double? decimal,
  }) {
    return _copyWith(
      text: text,
      whole: whole,
      decimal: decimal,
    );
  }

  Example _copyWith({
    Object? text,
    Object? whole,
    Object? decimal,
  }) {
    return Example.fromJson(
      text: text == kCopyWithDefault ? this.text : text as String?,
      whole: whole == kCopyWithDefault ? this.whole : whole as int?,
      decimal: decimal == kCopyWithDefault ? this.decimal : decimal as double?,
    );
  }
}
