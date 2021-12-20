// ignore_for_file: unused_import, file_names

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:generator_test/generator_test.dart';
import 'package:ice/ice.dart';
import 'package:ice/ice_builder.dart';
import 'package:ice/src/domain/ice_settings.dart';
import 'package:ice/src/ice.dart';
import 'package:ice/src/ice_union.dart';
import 'package:ice/src/method.dart';
import 'package:ice/src/util/unified_generator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() {
  const base = 'test/generators/ice_union';

  setUp(() {
    iceSettings = const IceSettings.defaultValues();
    GeneratorPath.setDirPath(
      input: base,
      output: '$base/output',
    );
  });

  final paths = [
    'basic',
  ];

  for (final file in paths) {
    test(file, () async {
      await testPartGenerator(
        file,
        const IceUnionGenerator(),
      );
    });
  }
}
