import 'package:copywith_plus/src/copywith.dart';
import 'package:copywith_plus/src/ice.dart';
import 'package:generator_test/generator_test.dart';
import 'package:test/test.dart';

void main() {
  group('generator', () {
    setUpAll(() {
      const base = 'test/ice_generator';
      GeneratorPath.setDirPath(
        input: '$base/input',
        output: '$base/output',
      );
    });

    test('generates a valid file', () async {
      await testPartGenerator(
        'basic',
        generator: () => const IceGenerator.manual('basic'),
      );
    });
  });
}

/*
?GOAL:
  ice:
    generate class:
      - all constructors
      - to/from json
      - props for equatable
      - toString
      - copyWith extension
  ice union:
    - ^ include ice ^
    - Union from json
    - typedef
      - result
      - no result
    extensions:
      - to json
      - toString
      - pattern match
        - map/when
        - maybe Map|When
        - map|when OrNull

*NEEDED:
  - fields

*PROCESS:
  - generate IceUnion classes first
  - generate IceUnionBase class

 */


/*
!GET FROM ELEMENT
  - fields:

*/
