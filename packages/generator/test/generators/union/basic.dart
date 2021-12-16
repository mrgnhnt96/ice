// ignore_for_file: unused_element, unused_field

import 'package:ice_annotation/ice.dart';

part 'output/basic.dart';

// If state is in another file, the user will need to pull in
// the _Ready and _NotReady classes.

@IceUnion.create
class State extends _$State {
  // unions must have 1 generative constructor
  // default, private, or named constructors are allowed
  // factories are not allowed
  const State(this.value);
  const State.empty() : value = '';

  const factory State.ready(int code) = _Ready;
  const factory State.notReady(String value) = _NotReady;

  final String value;
}

@IceUnion.of(State)
class _Ready extends _$Ready {
  const _Ready(this.code) : super.empty();

  final int code;
}

@IceUnion.of(State)
class _NotReady extends _$NotReady {
  const _NotReady(String value) : super(value);
}

dynamic _$ReadyFromJson(Map json) {}

dynamic _$ReadyToJson(_Ready instance) {}

dynamic _$NotReadyFromJson(Map json) {}

dynamic _$NotReadyToJson(_NotReady instance) {}
