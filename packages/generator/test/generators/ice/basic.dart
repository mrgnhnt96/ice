// ignore_for_file: unused_element, unused_field

import 'package:ice_annotation/ice.dart';

part 'output/basic.dart';

@Ice(
  copyWith: false,
  copyWithTypeSafe: true,
  equatable: false,
  tostring: false,
)
class State extends _$State {
  // unions must have 1 generative constructor
  // default, private, or named constructors are allowed
  // factories are not allowed
  const State();

  @copyWithEntryPoint
  const State.named();
}
