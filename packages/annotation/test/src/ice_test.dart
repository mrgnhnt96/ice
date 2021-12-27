import 'package:ice_annotation/src/ice.dart';
import 'package:test/test.dart';

void main() {
  group('$IceUnion', () {
    test('converts type to string', () {
      const union = IceUnion.of(_TestClass);

      expect(union.base, '$_TestClass');
    });

    test('base is $IceUnion when #create', () {
      const union = IceUnion.create();

      expect(union.base, '$IceUnion');
    });
  });
}

class _TestClass {
  const _TestClass();
}
