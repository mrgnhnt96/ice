import 'package:ice_annotation/ice.dart';

part 'ice_copy_with_ctor.g.dart';
part 'fixtures/ice_copy_with_ctor.dart';
// part 'ice_copy_with_ctor.ice.dart';

@Ice()
class Example extends _$Example {
  const Example(
    this.name, {
    required this.code,
    required this.flag,
  });

  @IceConstructor.copyWith
  const Example.no()
      : this(
          '',
          code: 1,
          flag: true,
        );

  const Example.not(
    String name,
    int code,
    bool flag,
  )   : name = name,
        code = code,
        flag = flag;

  const Example.some(this.code)
      : name = '',
        flag = true;

  final String name;
  final int code;
  final bool flag;

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);
}

@Ice()
class Example2 extends _$Example2 {
  const Example2(
    this.name, {
    required this.code,
    required this.flag,
  });

  const Example2.no()
      : this(
          '',
          code: 1,
          flag: true,
        );

  @IceConstructor.copyWith
  const Example2.not(
    String name,
    int code,
    bool flag,
  )   : name = name,
        code = code,
        flag = flag;

  const Example2.some(this.code)
      : name = '',
        flag = true;

  factory Example2.fromJson(Map<String, dynamic> json) =>
      _$Example2FromJson(json);

  final String name;
  final int code;
  final bool flag;
}

@Ice()
class Example3 extends _$Example3 {
  const Example3(
    this.name, {
    required this.code,
    required this.flag,
  });

  const Example3.named() : this('', code: 1, flag: true);

  const Example3.no()
      : this(
          '',
          code: 1,
          flag: true,
        );

  const Example3.not(
    String name,
    int code,
    bool flag,
  )   : name = name,
        code = code,
        flag = flag;

  @IceConstructor.copyWith
  const Example3.some(this.code)
      : name = '',
        flag = true;

  factory Example3.fromJson(Map<String, dynamic> json) =>
      _$Example3FromJson(json);

  final String name;
  final int code;
  final bool flag;
}
