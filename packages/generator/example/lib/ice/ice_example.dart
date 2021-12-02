import 'package:copywith_annotation/copywith.dart';
import 'package:equatable/equatable.dart';

part 'ice_example.ice.dart';

@ice
class _Example {
  const _Example({
    this.name,
    this.age,
    this.isMale,
    this.friends,
    this.data,
    this.father,
  });

  final String? name;
  final int? age;
  final bool? isMale;
  final List<String>? friends;
  final Map<String, dynamic>? data;
  final _Example? father;
}
