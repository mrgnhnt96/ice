import 'package:ice_annotation/ice.dart';

part 'fixtures/ice_no_methods.dart';
// part 'fixtures/ice_no_methods_bld_opt.dart';
// part 'ice_no_methods.ice.dart';

@Ice(
  copyWith: CopyWith.none,
  equatable: false,
  jsonSerializable: null,
  toString: false,
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

  final String name;
  final int code;
  final bool flag;
}
