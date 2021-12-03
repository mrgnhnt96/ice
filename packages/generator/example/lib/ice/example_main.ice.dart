part of 'main.dart';

@JsonSerializable()
class Example extends _Example with EquatableMixin {
  Example(
    String? name, {
    int? age,
    bool? isMale,
    List<String>? friends,
    Map<String, dynamic>? data,
    Example? father,
  }) : super(
          name,
          age: age,
          isMale: isMale,
          friends: friends,
          data: data,
          father: father,
        );

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleToJson(this);

  @override
  String toString() {
    return 'Example{name: $name, age: $age, isMale: $isMale, friends: $friends, data: $data, father: $father}';
  }

  @override
  List<Object?> get props {
    return [name, age, isMale, friends, data, father];
  }
}

extension ExampleX on Example {
  Example copyWith({
    String? name,
    int? age,
    bool? isMale,
    List<String>? friends,
    Map<String, dynamic>? data,
    Example? father,
  }) {
    return Example(
      name ?? this.name,
      age: age ?? this.age,
      isMale: isMale ?? this.isMale,
      friends: friends ?? this.friends,
      data: data ?? this.data,
      father: father ?? this.father,
    );
  }
}
