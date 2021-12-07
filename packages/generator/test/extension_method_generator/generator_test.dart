import 'package:generator_test/generator_test.dart';
import 'package:ice/src/method.dart';
import 'package:test/test.dart';

void main() {
  group('generator', () {
    setUpAll(() {
      const base = 'test/extension_method_generator';
      GeneratorPath.setDirPath(
        input: base,
        output: '$base/output',
      );
    });

    test('generates a valid file', () async {
      await testPartGenerator(
        'basic',
        const MethodGenerator(),
      );
    });
  });
}
