// ignore_for_file: unused_element, unused_field

import 'package:ice_annotation/ice.dart';

part 'output/non_primative.dart';

@ice
@Ice.union
abstract class $State with _$StateUnion {
  const $State();

  factory $State.fromJson(Map<String, dynamic> json, [State? orElse]) =>
      _$StateUnionFromJson(json, orElse);

  Map<String, dynamic> toJson() => _$StateUnionToJson(this);
}

@ice
class _$Initial extends $State {}

@ice
class _$Ready extends $State {
  const _$Ready(this.example);

  final Example example;
}

@ice
class _$Error extends $State {}

_Initial _$InitialFromJson(Map json) => _Initial();

Map<String, dynamic> _$InitialToJson(_Initial instance) => <String, dynamic>{};

_Ready _$ReadyFromJson(Map json) => _Ready(const Example('', 1));

Map<String, dynamic> _$ReadyToJson(_Ready instance) => <String, dynamic>{};

_Error _$ErrorFromJson(Map json) => _Error();

Map<String, dynamic> _$ErrorToJson(_Error instance) => <String, dynamic>{};

class Example {
  const Example(this.name, this.code);

  final String name;
  final int code;

  Example copyWith({
    String? name,
    int? code,
  }) {
    return Example(
      name ?? this.name,
      code ?? this.code,
    );
  }
}
