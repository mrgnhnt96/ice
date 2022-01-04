import 'package:ice_annotation/ice.dart';

part 'main.ice.dart';
part 'main.g.dart';

// Ice Annotation:
// remove equatable on false

@Ice()
class Example<T> extends _$Example<T> {
  const Example(this.value);

  @TConv<T>()
  final T value;
}

class TConv<T> extends JsonConverter<T, String> {
  const TConv();

  @override
  T fromJson(String json) {
    return json as T;
  }

  @override
  String toJson(T object) {
    return '$object';
  }
}
