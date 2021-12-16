// ignore_for_file: overridden_fields, annotate_overrides

import 'package:ice_annotation/ice.dart';

part 'output/basic.dart';

@Ice(
  copyWith: false,
  copyWithTypeSafe: true,
  equatable: false,
  tostring: false,
)
class State extends _$State {
  const State(
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

  final String name;
  final int? age;
  final double? money;
  final bool? isCool;
  final DateTime? date;
}

Map<String, dynamic> _$$StateToJson(_$State state) => <String, dynamic>{};
_$State _$$StateFromJson(Map<String, dynamic> json) => _$State('', 1);
