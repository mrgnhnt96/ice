// ignore_for_file: unused_element, unused_field

import 'package:ice_annotation/ice.dart';

part 'output/basic.dart';

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
class _$Ready extends $State {}

@ice
class _$Error extends $State {}

_Initial _$InitialFromJson(Map json) => _Initial();

Map<String, dynamic> _$InitialToJson(_Initial instance) => <String, dynamic>{};

_Ready _$ReadyFromJson(Map json) => _Ready();

Map<String, dynamic> _$ReadyToJson(_Ready instance) => <String, dynamic>{};

_Error _$ErrorFromJson(Map json) => _Error();

Map<String, dynamic> _$ErrorToJson(_Error instance) => <String, dynamic>{};
