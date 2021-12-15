// ignore_for_file: unused_element, unused_field

import 'package:ice_annotation/ice.dart';

part 'output/basic.dart';

@IceUnion.create
class State extends _$State {
  // unions must have 1 generative constructor
  // default, private, or named constructors are allowed
  // factories are not allowed
  const State();

  @unionEntryPoint
  const State.named();

  const factory State.ready() = _Ready;
  const factory State.notReady() = _NotReady;
}

@IceUnion.of(State)
class _Ready extends _$Ready {
  const _Ready();
}

@IceUnion.of(State)
class _NotReady extends _$NotReady {
  @copyWithEntryPoint
  const _NotReady();
}

dynamic _$ReadyFromJson(Map json) {}

dynamic _$ReadyToJson(_Ready instance) {}

dynamic _$NotReadyFromJson(Map json) {}

dynamic _$NotReadyToJson(_NotReady instance) {}
