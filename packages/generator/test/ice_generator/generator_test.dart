// ignore_for_file: unused_import

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:generator_test/generator_test.dart';
import 'package:ice/ice.dart';
import 'package:ice/src/copywith.dart';
import 'package:ice/src/ice.dart';
import 'package:ice/src/ice_union_base.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() {
  group('generator', () {
    setUpAll(() {
      const base = 'test/ice_generator';
      GeneratorPath.setDirPath(
        input: base,
        output: '$base/output',
      );
    });

    test('generates a valid file', () async {
      const file = 'basic';
      await testPartGenerators(
        [file],
        [
          const IceGenerator(),
          const CopyWithGenerator(),
          const IceUnionBaseGenerator(),
        ],
      );
    });

    test('builder', () async {
      await testPackageBuilder(
        ['basic'],
        builder: iceBuilder,
      );
    });
  });
}

class TestBuilderOptions extends BuilderOptions {
  TestBuilderOptions(Map<String, dynamic> config) : super(config);
}
