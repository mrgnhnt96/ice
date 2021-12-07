// ignore_for_file: unused_import

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:generator_test/generator_test.dart';
import 'package:ice/ice.dart';
import 'package:ice/src/ice.dart';
import 'package:ice/src/ice_union.dart';
import 'package:ice/src/method.dart';
import 'package:ice/src/util/unified_generator.dart';
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
      await testPartGenerator(
        'basic',
        const UnifiedGenerator(
          [
            IceGenerator(),
            MethodGenerator(),
            IceUnionGenerator(),
          ],
          name: IceGenerator.name,
        ),
      );
    });

    test('builder', () async {
      await testPackageBuilder(
        'basic',
        builder: iceBuilder,
      );
    });
  });
}
