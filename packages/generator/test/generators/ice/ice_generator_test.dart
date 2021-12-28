import 'package:generator_test/generator_test.dart';
import 'package:ice/ice.dart';
import 'package:ice/src/domain/ice_settings.dart';
import 'package:ice/src/generator.dart';
import 'package:test/test.dart';

void main() {
  const base = 'test/generators/ice';

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
        const IceGenerator(),
      );
    });
  }
}
