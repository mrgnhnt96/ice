// ignore_for_file: unnecessary_cast

import 'package:copywith_annotation/copywith.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'union_example.dart';
part 'union_example.ice.dart';
part 'main.g.dart';

void main() {
  final state = _Error('data', message: 'message') as State;

  final helloState = state.map(
    initial: (initial) {
      return 'Hello ${initial.runtimeType}';
    },
    ready: (ready) {
      return 'Hello ${ready.runtimeType}';
    },
    error: (error) {
      return 'Hello ${error.runtimeType}';
    },
  );

  final helloData = state.when(
    initial: () => '',
    ready: (data) => data,
    error: (data, message, fix) => '$data, $message, $fix',
  );

  final errorToJson = state.toJson();
  final errorToJsonWithoutType = state.toJson(includeRuntimeType: false);

  final errorFromJson = _Error.fromJson(errorToJson);
  final stateFromJson = State.fromJson(errorToJson);

  print('\n\nerrorToJson:\n$errorToJson');
  print('\n\nstateFromJson:\n$stateFromJson');
  print('\n\nerrorFromJson:\n$errorFromJson');
  print('\n\nerrorToJsonWithoutType:\n$errorToJsonWithoutType');
  print('\n\nhelloState:\n$helloState');
  print('\n\nhelloData:\n$helloData');

  final errorFromJsonWithoutType = _Error.fromJson(errorToJsonWithoutType);
  print('\n\nerrorFromJsonWithoutType:\n$errorFromJsonWithoutType');

  final stateFromJsonWithoutType = State.fromJson(errorToJsonWithoutType);
  print('\n\nstateFromJsonWithoutType:\n$stateFromJsonWithoutType');
}
