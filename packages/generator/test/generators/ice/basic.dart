// ignore_for_file: overridden_fields, annotate_overrides

import 'package:enum_assist_annotation/enum_assist_annotation.dart';
import 'package:ice_annotation/ice.dart';

part 'output/basic.dart';

@Ice()
@JsonSerializable()
class State extends _$State {
  const State(
    this.name,
    this.age, {
    this.money,
    this.isCool,
    this.date,
  });

  @copyWithEntryPoint
  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  final String name;
  final int? age;
  final double? money;
  final bool? isCool;
  final DateTime? date;
}

Map<String, dynamic> _$StateToJson(_$State state) => <String, dynamic>{};
State _$StateFromJson(Map<String, dynamic> json) => const State('', 1);
