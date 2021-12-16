// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:, prefer_const_declarations, unused_local_variable

part of '../basic.dart';

typedef CopyCallback<T> = T Function(T);

abstract class _$State with EquatableMixin {
  const _$State();

  String get name;
  int? get age;
  double? get money;
  bool? get isCool;
  DateTime? get date;

  State copyWith({
    String? name,
    int? age,
    double? money,
    bool? isCool,
    DateTime? date,
  }) {
    return State(
      name ?? this.name,
      age ?? this.age,
      money: money ?? this.money,
      isCool: isCool ?? this.isCool,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [name, age, money, isCool, date];

  Map<String, dynamic> toJson() => _$StateToJson(this);

  @override
  String toString() {
    return '''
State(
  name: $name
  age: $age
  money: $money
  isCool: $isCool
  date: $date
)''';
  }
}
