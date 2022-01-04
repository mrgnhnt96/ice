// ignore_for_file: overridden_fields, annotate_overrides

import 'package:ice_annotation/ice.dart';

part 'output/basic_generic.dart';

@Ice()
class Example<T> extends _$Example {
  const Example(this.value);

  @TConv()
  final T value;
}

class TConv extends JsonConverter<dynamic, String> {
  const TConv();

  @override
  dynamic fromJson(String json) {
    return json;
  }

  @override
  String toJson(dynamic object) {
    return '$object';
  }
}
