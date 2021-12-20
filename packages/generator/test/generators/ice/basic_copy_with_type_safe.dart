// ignore_for_file: overridden_fields, annotate_overrides

import 'package:enum_assist_annotation/enum_assist_annotation.dart';
import 'package:ice_annotation/ice.dart';

part 'output/basic_copy_with_type_safe.dart';

@JsonSerializable()
@Ice(copyWithType: CopyWithType.simple)
class Example extends _$State {
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

  factory Example.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  final String name;
  final int? age;
  final double? money;
  final bool? isCool;
  final DateTime? date;
}

Map<String, dynamic> _$StateToJson(_$State state) => <String, dynamic>{};
Example _$StateFromJson(Map<String, dynamic> json) => const Example('', 1);
