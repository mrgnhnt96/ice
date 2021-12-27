// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/position_type.dart';
import 'package:ice/src/templates/ice_templates/ice_template.dart';

extension on Constructor {
  String get args {
    final args = <String>[];

    for (final param in params) {
      final name = param.name;

      if (param.positionType.isNamed) {
        args.add('$name: $name');
        continue;
      }

      args.add(name);
    }

    return args.join(',\n');
  }
}

/// A template to generate methods for
/// - copyWith()
/// - Equatable Props
/// - toString()
class UnionClassTemplate extends IceTemplate {
  UnionClassTemplate.forSubject(
    Class subject, {
    required Class? union,
  }) : super.wrapper(subject, union: union);

  @override
  void writeProperties(StringBuffer buffer) {
    super.writeProperties(buffer);

    if (union != null || subjectIsUnionBase) {
      buffer
        ..writeln()
        ..writeln('@override')
        ..writeln(
          "String get \$unionType => '${subject.name}';",
        );
    }
  }

  @override
  void constructor(StringBuffer buffer) {
    if (subjectIsOfUnion) {
      buffer
        ..writeAll(
          union!.constructors
              .where((c) => c.isGenerative)
              .map<String>((superConst) {
            final constStr = superConst.isConst ? 'const ' : '';
            var superName = superConst.name;
            if (superName.isNotEmpty) {
              superName = '.$superName';
            }
            return '$constStr${subject.genName}${superConst.declaration} '
                ': super$superName(${superConst.args});';
          }),
        )
        ..writeln('\n');
    } else {
      buffer
        ..writeln('const ${subject.genName}();')
        ..writeln('\n');
    }
  }
}
