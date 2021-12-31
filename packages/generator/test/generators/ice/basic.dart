// ignore_for_file: overridden_fields, annotate_overrides

import 'package:ice_annotation/ice.dart';

import 'basic_copy_with_type_safe.dart';

part 'output/basic.dart';

@IceUnion.create()
class State extends _$State {
  State(
    this.name,
    this.age, {
    this.money,
    this.isCool,
    this.date,
    this.father = 'dad',
    this.example,
  });

  @IceConstructor.fromJson
  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  String? _pet;

  String get pet => _pet ?? 'No pet';
  set pet(String value) {
    _pet = value;
  }

  String father;
  final String name;
  @IceField.ignoreProp
  final int? age;
  final double? money;
  final bool? isCool;
  @JsonKey(ignore: true)
  final DateTime? date;
  final Example? example;
}

Map<String, dynamic> _$StateToJson(_$State state) => <String, dynamic>{};
State _$StateFromJson(Map<String, dynamic> json) => State('', 1);

@IceUnion.of(State)
class Ready {
  const Ready();
}

@IceUnion.of(State)
class NotReady {
  const NotReady();
}

@Ice.only(copyWith: CopyWith.nullSafe)
class Something {}

@Ice()
class Else {}
