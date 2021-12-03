// ignore_for_file: unused_element, unused_field

import 'package:ice_annotation/ice.dart';

@Ice()
class _Example {
  const _Example({
    this.name,
    this.age,
    this.isMale,
    this.friends,
    this.data,
    String? fatherName,
  }) : _father = const _Example(name: fatherName);

  final String? name;
  final int? age;
  final bool? isMale;
  final List<String>? friends;
  final Map<String, dynamic>? data;
  final _Example? _father;
}

@IceUnionBase()
abstract class State {
  const State();
}

@Ice.union(State)
class _$Initial extends State {
  const _$Initial();
}

@Ice.union(State)
class _$Ready extends State {
  const _$Ready(this.data);

  final String data;
}

@Ice.union(State)
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
