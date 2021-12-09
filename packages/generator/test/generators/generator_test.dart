// ignore_for_file: unused_import

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:generator_test/generator_test.dart';
import 'package:ice/ice.dart';
import 'package:ice/ice_builder.dart';
import 'package:ice/src/ice.dart';
import 'package:ice/src/ice_union.dart';
import 'package:ice/src/method.dart';
import 'package:ice/src/util/unified_generator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() {
  final iceBuilder = IceBuilder();
  const base = 'test/generators';

  setUp(() {
    GeneratorPath.setDirPath(
      input: base,
      output: '$base/output',
    );
  });

  void setPath(String name) {
    final _base = '$base/$name';

    GeneratorPath.setDirPath(
      input: _base,
      output: '$_base/output',
    );
  }

  final paths = {
    'ice': [
      'basic',
      'non_primative',
    ]
  };

  for (final path in paths.entries) {
    for (final file in path.value) {
      test('$path $file', () async {
        setPath(path.key);

        await testPartGenerator(
          file,
          iceBuilder.generators.first,
        );
      });
    }
  }
}
