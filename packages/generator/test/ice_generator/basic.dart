// ignore_for_file: unused_element, unused_field

import 'package:ice_annotation/ice.dart';

@ice
class _Example {
  const _Example(
    this.name, {
    this.age,
    this.isMale,
    this.friends,
    this.data,
    String? fatherName,
  }) : _father = const _Example(fatherName);

  const _Example.empty()
      : this(
          null,
          age: null,
          isMale: null,
          friends: null,
          data: null,
        );

  final String? name;
  final int? age;
  final bool? isMale;
  final List<String>? friends;
  final Map<String, dynamic>? data;
  final _Example? _father;
}

@Ice.createUnion
abstract class State {
  const State();
}

@Ice.createUnion
@ice
class _$Initial extends State {
  const _$Initial();
}

@ice
class _$Ready extends _$Initial {
  const _$Ready(this.data);

  final String data;
}

@ice
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
