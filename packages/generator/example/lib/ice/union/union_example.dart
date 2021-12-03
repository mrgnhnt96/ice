// ignore_for_file: unused_element

part of 'main.dart';

@IceUnionBase()
abstract class State {
  const State();

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);
}

@Ice.union(State)
class _$Initial extends State {
  const _$Initial();
}

@Ice.privateUnion(State)
class _$Ready extends State {
  const _$Ready(this.data);

  final String data;
}

@Ice.privateUnion(State)
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

@Ice()
class _ModelClass {
  const _ModelClass();
}
