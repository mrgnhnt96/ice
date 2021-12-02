part of 'ice_example.dart';

class Example extends _Example with EquatableMixin {
  Example({
    String? name,
    int? age,
    bool? isMale,
    List<String>? friends,
    Map<String, dynamic>? data,
    _Example? father,
  }) : super(
          name: name,
          age: age,
          isMale: isMale,
          friends: friends,
          data: data,
          father: father,
        );

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
    _Example? father,
  }) {
    return Example(
      name: name ?? this.name,
      age: age ?? this.age,
      isMale: isMale ?? this.isMale,
      friends: friends ?? this.friends,
      data: data ?? this.data,
      father: father ?? this.father,
    );
  }
}
