import 'package:ice_annotation/ice.dart';

part 'main.ice.dart';
part 'main.g.dart';
part 'state.dart';

// Ice Annotation:
// remove equatable on false

@IceUnion.of(State)
class Example extends _$Example {
  @iceJsonConstructor
  const Example({
    this.text,
    this.whole,
    this.decimal,
    this.flag,
    this.date,
    this.list,
    this.set,
  }) : super.empty();

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);

  final String? text;
  final int? whole;
  final double? decimal;
  final bool? flag;
  final DateTime? date;
  final List<String>? list;
  final Set<String>? set;
}

@IceUnion.of(State)
class Other extends _$Other {
  const Other(int code) : super(code);
}

@IceUnion.of(State)
class Error extends _$Error {
  const Error(int code) : super(code);
}
