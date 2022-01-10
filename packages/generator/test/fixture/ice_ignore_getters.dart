import 'package:ice_annotation/ice.dart';

part 'fixtures/ice_ignore_getters.dart';
// part 'fixtures/ice_ignore_getters_bld_opt.dart';
// part 'ice_ignore_getters.ice.dart';
part 'ice_ignore_getters.g.dart';

@Ice(
  ignoreGettersAsProps: false,
)
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

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);

  final String name;
  final int code;
  final bool flag;

  String get other => 'other';
}
