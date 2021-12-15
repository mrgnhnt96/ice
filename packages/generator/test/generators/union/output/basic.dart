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

abstract class _$State with _$StateUnion implements $State {
  const _$State();

  @override
  String get $StateType => 'State';
}

abstract class _$Ready extends State {
  const _$Ready();

  @override
  String get $StateType => '_Ready';
}

abstract class _$NotReady extends State {
  const _$NotReady();

  @override
  String get $StateType => '_NotReady';
}

typedef _Result<R, T extends $State> = R Function(T);
typedef _NoResult<R> = R Function();

mixin _$StateUnion {
  R map<R extends Object?>({
    required _Result<R, _Ready> ready,
    required _Result<R, _NotReady> notReady,
  }) {
    switch (this.runtimeType) {
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
