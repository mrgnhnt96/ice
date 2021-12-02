import 'package:copywith_plus/src/copywith.dart';
import 'package:generator_test/generator_test.dart';
import 'package:test/test.dart';

void main() {
  group('generator', () {
    setUpAll(() {
      const base = 'test/copywith_generator';
      GeneratorPath.setDirPath(
        input: base,
        output: '$base/output',
      );
    });

    test('generates a valid file', () async {
      await testPartGenerator(
        'basic',
        generator: () => const CopyWithGenerator.manual('basic'),
      );
    });
  });
}

/*
GOAL:
  - Find constructor
  - If length == 1
    - true: use constructor
    - false: use annotated constructor (or defined entrypoint)
    - Throw if none found
  - Get params from constructor
  - Generate copyWith
 */


/*
GET FROM ELEMENT::::

- constructor:
  - location:
    * element.constructors // List<ConstructorElement>
  - name:
    * element.constructors[i].displayName // Example._
    * element.constructors[i].name // _
  - annotation:
    - location:
      * element.constructors[i].metadata // List<ElementAnnotation>
    - name:
      * element.constructors[i].metadata[i].element.displayName // CopyWithEntrypoint

- params:
  - location:
    * element.constructors[i].parameters // List<ParameterElement>
  - name:
    * element.constructors[i].parameters[i].displayName // text
  - type:
    - name:
      * element.constructors[i].parameters[i].type.displayName // String
    - isNullable:
      * element.constructors[i].parameters[i].type.nullabilitySuffix // NullabilitySuffix.question
*/
