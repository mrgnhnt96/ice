// ignore_for_file: overridden_fields, annotate_overrides

import 'package:enum_assist_annotation/enum_assist_annotation.dart';
import 'package:ice_annotation/ice.dart';

part 'output/basic.dart';

@Ice()
@JsonSerializable(
  createToJson: false,
)
class State extends _$State {
  State(
    this.name,
    this.age, {
    this.money,
    this.isCool,
    this.date,
    this.father = 'dad',
  });

  @CopyWith.constructor
  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  String? _pet;

  String get pet => _pet ?? 'No pet';
  set pet(String value) {
    _pet = value;
  }

  String father;
  final String name;
  @ignoreProp
  final int? age;
  final double? money;
  final bool? isCool;
  @JsonKey(ignore: true)
  final DateTime? date;
}

Map<String, dynamic> _$StateToJson(_$State state) => <String, dynamic>{};
State _$StateFromJson(Map<String, dynamic> json) => State('', 1);
