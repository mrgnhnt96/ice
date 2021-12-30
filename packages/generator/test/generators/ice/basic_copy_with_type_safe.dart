// ignore_for_file: overridden_fields, annotate_overrides

import 'package:ice_annotation/ice.dart';

part 'output/basic_copy_with_type_safe.dart';

@JsonSerializable()
@Ice(copyWith: CopyWith.simple)
class Example extends _$Example {
  const Example(
    this.name,
    this.age, {
    this.money,
    this.isCool,
    this.date,
  }) : super.ice(
          name,
          age,
          money: money,
          isCool: isCool,
          date: date,
        );

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);

  final String name;
  final int? age;
  final double? money;
  final bool? isCool;
  final DateTime? date;
}

Map<String, dynamic> _$ExampleToJson(_$Example state) => <String, dynamic>{};
Example _$ExampleFromJson(Map<String, dynamic> json) => const Example('', 1);
