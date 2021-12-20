// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of '../basic.dart';

// mixin _$StateUnion {
//   void map() {}
// void maybeMap() {}
// void mapOrNull() {}

// void when() {}
// void maybeWhen() {}
// void whenOrNull() {}
// }

abstract class $State {
  String get $StateType;
}

abstract class _$State with _$StateUnion, EquatableMixin implements $State {
  const _$State();

  int get code;

  @override
  String get $StateType => 'State';

  @override
  List<Object> get props => [code];

  @override
  String toString() {
    return '''
State(
  code: $code
)''';
  }
}

abstract class _$Ready extends State {
  const _$Ready(int code) : super(code);
  const _$Ready.empty() : super.empty();

  String get message;

  @override
  String get $StateType => '_Ready';

  _Ready copyWith({String? message}) {
    return _Ready(message ?? this.message);
  }

  @override
  List<Object> get props => [code, message];

  @override
  String toString() {
    return '''
Ready(
  message: $message
)''';
  }
}

abstract class _$NotReady extends State {
  const _$NotReady(int code) : super(code);
  const _$NotReady.empty() : super.empty();

  bool get willBe;

  _NotReady copyWith({bool? willBe}) {
    return _NotReady(willBe: willBe ?? this.willBe);
  }

  @override
  String get $StateType => '_NotReady';

  @override
  List<Object> get props => [code, willBe];

  @override
  String toString() {
    return '''
NotReady(
  willBe: $willBe
)''';
  }
}

typedef _Result<R, T extends $State> = R Function(T);
typedef _NoResult<R> = R Function();

mixin _$StateUnion {
  R map<R extends Object?>({
    required _Result<R, _Ready> ready,
    required _Result<R, _NotReady> notReady,
  }) {
    switch (runtimeType) {
      case _Ready:
        return ready(this as _Ready);
      case _NotReady:
        return notReady(this as _NotReady);
      default:
        throw UnsupportedError('Unsupported type: $this');
    }
  }

  void maybeMap() {}
  void mapOrNull() {}

  void when() {}
  void maybeWhen() {}
  void whenOrNull() {}

  bool get isReady => this is _Ready;
  bool get isNotReady => this is _NotReady;
}
