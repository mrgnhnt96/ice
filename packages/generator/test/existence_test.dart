import 'package:test/test.dart';

import './fixture/contained_union.dart' as i1;
import './fixture/contained_union_no_methods.dart' as i2;
import './fixture/ice.dart' as i3;
import './fixture/ice_ignore_getters.dart' as i4;
import './fixture/ice_no_methods.dart' as i15;
import './fixture/union.dart' as i6;
import './fixture/union_ignore_getters.dart' as i7;
import './fixture/union_no_methods.dart' as i8;
import 'util/mirror_util.dart';

void main() {
  group('contained_union', () {
    group('${i1.Example}', () {
      ExistenceTest<i1.Example>(
        copyWith: false,
        fromJson: false,
        props: true,
        toJson: true,
      ).runTests();
    });

    group('${i1.A}', () {
      ExistenceTest<i1.A>(
        copyWith: true,
        fromJson: true,
        props: true,
        toJson: true,
      ).runTests();
    });

    group('${i1.B}', () {
      ExistenceTest<i1.B>(
        copyWith: true,
        fromJson: true,
        props: true,
        toJson: true,
      ).runTests();
    });

    group('${i1.C}', () {
      ExistenceTest<i1.C>(
        copyWith: true,
        fromJson: true,
        props: true,
        toJson: true,
      ).runTests();
    });
  });

  group('contained_union_no_methods', () {
    group('${i2.Example}', () {
      ExistenceTest<i2.Example>(
        copyWith: false,
        fromJson: false,
        props: false,
        toJson: false,
      ).runTests();
    });

    group('${i2.A}', () {
      ExistenceTest<i2.A>(
        copyWith: false,
        fromJson: false,
        props: false,
        toJson: false,
      ).runTests();
    });

    group('${i2.B}', () {
      ExistenceTest<i2.B>(
        copyWith: false,
        fromJson: false,
        props: false,
        toJson: false,
      ).runTests();
    });

    group('${i2.C}', () {
      ExistenceTest<i2.C>(
        copyWith: false,
        fromJson: false,
        props: false,
        toJson: false,
      ).runTests();
    });
  });

  group('ice', () {
    ExistenceTest<i3.Example>(
      copyWith: true,
      fromJson: false,
      props: true,
      toJson: true,
    ).runTests();
  });

  group('ice_ignore_getters', () {
    ExistenceTest<i4.Example>(
      copyWith: true,
      fromJson: false,
      props: true,
      toJson: true,
    ).runTests();
  });

  group('ice_no_methods', () {
    ExistenceTest<i15.Example>(
      copyWith: false,
      fromJson: false,
      props: false,
      toJson: false,
    ).runTests();
  });

  group('union', () {
    group('${i6.Example}', () {
      ExistenceTest<i6.Example>(
        copyWith: true,
        // fromJson is generated for the _$Example class
        fromJson: false,
        props: true,
        toJson: true,
      ).runTests();
    });

    group('${i6.Other}', () {
      ExistenceTest<i6.Other>(
        copyWith: true,
        // fromJson is generated for the _$Other class
        fromJson: false,
        props: true,
        toJson: true,
      ).runTests();
    });

    group('${i6.State}', () {
      ExistenceTest<i6.State>(
        copyWith: false,
        fromJson: false,
        props: true,
        toJson: true,
      ).runTests();
    });
  });

  group('union_ignore_getters', () {
    group('${i7.Example}', () {
      ExistenceTest<i7.Example>(
        copyWith: true,
        // fromJson is generated for the _$Example class
        fromJson: false,
        props: true,
        toJson: true,
      ).runTests();
    });

    group('${i7.Other}', () {
      ExistenceTest<i7.Other>(
        copyWith: true,
        // fromJson is generated for the _$Other class
        fromJson: false,
        props: true,
        toJson: true,
      ).runTests();
    });

    group('${i7.State}', () {
      ExistenceTest<i7.State>(
        copyWith: false,
        fromJson: false,
        props: true,
        toJson: true,
      ).runTests();
    });
  });

  group('union_no_methods', () {
    group('${i8.Example}', () {
      ExistenceTest<i8.Example>(
        copyWith: false,
        fromJson: false,
        props: false,
        toJson: false,
      ).runTests();
    });

    group('${i8.Other}', () {
      ExistenceTest<i8.Other>(
        copyWith: false,
        fromJson: false,
        props: false,
        toJson: false,
      ).runTests();
    });

    group('${i8.State}', () {
      ExistenceTest<i8.State>(
        copyWith: false,
        fromJson: false,
        props: false,
        toJson: false,
      ).runTests();
    });
  });
}

class ExistenceTest<T> {
  ExistenceTest({
    required bool copyWith,
    required bool fromJson,
    required bool toJson,
    required bool props,
  })  : copyWith = copyWith.matcher,
        fromJson = fromJson.matcher,
        toJson = toJson.matcher,
        props = props.matcher;

  final Matcher copyWith;
  final Matcher fromJson;
  final Matcher toJson;
  final Matcher props;

  void runTests() {
    testCopyWith();
    testFromJson();
    testToJson();
    testProps();
  }

  bool _hasMember(String name) {
    return hasMember(T, name);
  }

  bool _hasConstructor(String name) {
    return hasConstructor(T, name);
  }

  void testCopyWith() {
    test('${copyWith.testContains} copyWith', () {
      expect(_hasMember('copyWith'), copyWith);
    });
  }

  void testFromJson() {
    test('${fromJson.testContains} fromJson', () {
      expect(_hasConstructor('fromJson'), fromJson);
    });
  }

  void testToJson() {
    test('${toJson.testContains} toJson', () {
      expect(_hasMember('toJson'), toJson);
    });
  }

  void testProps() {
    test('${props.testContains} props', () {
      expect(_hasMember('props'), props);
    });
  }
}

extension on bool {
  Matcher get matcher => this ? isTrue : isFalse;
}

extension on Matcher {
  String get testContains {
    if (this == isTrue) {
      return 'contains';
    } else {
      return 'does not contain';
    }
  }
}
