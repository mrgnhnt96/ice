// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

@JsonSerializable()
class _Example extends _$Example with EquatableMixin {
  _Example(String? name,
      {int? age,
      bool? isMale,
      List<String>? friends,
      Map<String, dynamic>? data,
      dynamic father})
      : super(
          name,
          age: age,
          isMale: isMale,
          friends: friends,
          data: data,
          father: father,
        );

  factory _Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleToJson(this);

  @override
  String toString() {
    return '_Example{name: ${name}, age: ${age}, isMale: ${isMale}, friends: ${friends}, data: ${data}, father: ${father}}';
  }

  @override
  List<Object?> get props {
    return [name, age, isMale, friends, data, father];
  }

  _Example copyWith({
    String? name,
    int? age,
    bool? isMale,
    List<String>? friends,
    Map<String, dynamic>? data,
    dynamic father,
  }) {
    _Example _copyWith({
      Object? name,
      Object? age,
      Object? isMale,
      Object? friends,
      Object? data,
      Object? father,
    }) {
      return _Example(
        name == kCopyWithDefault ? this.name : name as String?,
        age: age == kCopyWithDefault ? this.age : age as int?,
        isMale: isMale == kCopyWithDefault ? this.isMale : isMale as bool?,
        friends: friends == kCopyWithDefault
            ? this.friends
            : friends as List<String>?,
        data: data == kCopyWithDefault
            ? this.data
            : data as Map<String, dynamic>?,
        father: father == kCopyWithDefault ? this.father : father as dynamic,
      );
    }

    return _copyWith(
      name: name,
      age: age,
      isMale: isMale,
      friends: friends,
      data: data,
      father: father,
    );
  }
}
