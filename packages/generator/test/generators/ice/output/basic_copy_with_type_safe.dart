// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:, prefer_const_declarations, unused_local_variable

part of '../basic_copy_with_type_safe.dart';

typedef CopyCallback<T> = T Function(T);

class _$Example with EquatableMixin {
  factory _$Example(
    String name,
    int? age, {
    double? money,
    bool? isCool,
    DateTime? date,
  }) = Example;

  const _$Example.ice(
    this.name,
    this.age, {
    this.money,
    this.isCool,
    this.date,
  });

  final String name;
  final int? age;
  final double? money;
  final bool? isCool;
  final DateTime? date;

  Example copyWith({
    CopyCallback<String>? name,
    CopyCallback<int?>? age,
    CopyCallback<double?>? money,
    CopyCallback<bool?>? isCool,
    CopyCallback<DateTime?>? date,
  }) {
    return Example(
      name == null ? this.name : name(this.name),
      age == null ? this.age : age(this.age),
      money: money == null ? this.money : money(this.money),
      isCool: isCool == null ? this.isCool : isCool(this.isCool),
      date: date == null ? this.date : date(this.date),
    );
  }

  @override
  List<Object?> get props => [name, age, money, isCool, date];

  Map<String, dynamic> toJson() => _$ExampleToJson(this);

  @override
  String toString() {
    return '''
Example(
  name: $name
  age: $age
  money: $money
  isCool: $isCool
  date: $date
)''';
  }
}
