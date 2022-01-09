import 'package:generator_test/generator_test.dart';
import 'package:ice/ice.dart';
import 'package:ice/src/domain/ice_settings.dart';
import 'package:test/test.dart';

void main() {
  const files = [
    'contained_union_generic',
    'contained_union_no_methods',
    'contained_union',
    'ice_copy_with_ctor',
    'ice_generic_copy_with_ctor',
    'ice_generic_json_ctor',
    'ice_generic',
    'ice_ignore_getters',
    'ice_json_ctor',
    'ice_no_methods',
    'ice',
    'union_copy_with_ctor',
    'union_generic_copy_with_ctor',
    'union_generic_json_ctor',
    'union_generic',
    'union_ignore_getters',
    'union_json_ctor',
    'union_no_methods',
    'union',
  ];

  for (final fileName in files) {
    test(fileName, () async {
      await testPackageBuilder(
        fileName,
        builder: iceBuilder,
        inputDir: 'test/fixture',
        fixtureDir: 'test/fixture/fixtures',
        builderOptions: IceSettings.debug(),
        extension: iceExtension,
      );
    });
  }
}
