// ignore_for_file: unused_element

part of 'main.dart';

abstract class State {
  const State();

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);
}

@IceUnion(State)
class _$Initial extends State {
  const _$Initial();
}

@IceUnion.private(State)
class _$Ready extends State {
  const _$Ready(this.data);

  final String data;
}

@IceUnion.private(State)
class _$Error extends State {
  const _$Error(
    this.data, {
    required this.message,
    this.fix,
  });

  final String data;
  final String message;
  final String? fix;
}

@ice
class _ModelClass {
  const _ModelClass();
}
