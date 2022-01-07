// ignore_for_file: unused_import

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:generator_test/generator_test.dart';
import 'package:ice/ice.dart';
import 'package:ice/src/domain/ice_settings.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
    const base = 'test/builder';
    GeneratorPath.setDirPath(
      input: base,
      output: '$base/output',
    );
  });

  test('builder', () async {
    await testPackageBuilder(
      'contained',
      builder: iceBuilder,
      builderOptions: IceSettings.debug(),
      extension: iceExtension,
      header: iceHeader,
    );
  });
}
