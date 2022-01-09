import 'package:ice_annotation/ice.dart';

part 'ice.g.dart';
part 'fixtures/ice.dart';

@Ice()
class Example extends _$Example {
  const Example(
    this.name, {
    required this.code,
    required this.flag,
  });

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
}
