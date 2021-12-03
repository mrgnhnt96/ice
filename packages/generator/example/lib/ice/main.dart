import 'package:ice_annotation/ice.dart';

part 'main.g.dart';
part 'main.ice.dart';

@Ice()
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
  final Example? father;
}
