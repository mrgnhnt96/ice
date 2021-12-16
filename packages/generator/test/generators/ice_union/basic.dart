// ignore_for_file: unused_element, unused_field, annotate_overrides

import 'package:ice_annotation/ice.dart';

part 'output/basic.dart';

// If state is in another file, the user will need to pull in
// the _Ready and _NotReady classes.

@Ice()
@IceUnion.create
class State extends _$State {
  // unions must have 1 generative constructor
  // default, private, or named constructors are allowed
  // factories are not allowed
  const State(this.code);
  const State.empty() : code = 0;

  const factory State.ready(String message) = _Ready;
  const factory State.notReady({required bool willBe}) = _NotReady;

  final int code;
}

@Ice()
@IceUnion.of(State)
class _Ready extends _$Ready {
  const _Ready(this.message) : super.empty();

  final String message;
}

@Ice()
@IceUnion.of(State)
class _NotReady extends _$NotReady {
  const _NotReady({required this.willBe}) : super(1);

  final bool willBe;
}

dynamic _$ReadyFromJson(Map json) {}

dynamic _$ReadyToJson(_Ready instance) {}

dynamic _$NotReadyFromJson(Map json) {}

dynamic _$NotReadyToJson(_NotReady instance) {}
