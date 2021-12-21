part of 'main.dart';

@IceUnion.create
class State extends _$State {
  const State(this.code);
  const State.empty() : code = 0;

  final int code;
}
