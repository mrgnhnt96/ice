// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/position_type.dart';
import 'package:ice/src/templates/ice_templates/ice_template.dart';

extension on Class {
  String get baseName => '\$$cleanName';

  String classHeader([Class? union]) {
    if (union != null) {
      if (!annotations.isUnionBase) {
        return 'abstract class $genName extends ${union.name}';
      }

      return union.classHeader();
    }

    final hasEquatable = metaSettings(
      methodCallback: (_) => false,
      iceCallback: (settings) => settings.equatable,
      settingsCallback: (settings) => settings.equatable,
    );
    var mixins = '';
    var implements = '';

    if (hasEquatable) {
      mixins = ' with EquatableMixin';
    }

    if (annotations.isUnionBase) {
      implements = ' implements $baseName';
      final unionMixin = '_\$${cleanName}Mixin';
      mixins = '$mixins, $unionMixin';
    }

    return 'abstract class $genName$mixins$implements';
  }
}

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
  String get classHeader => subject.classHeader(union);

  @override
  void writeProperties(StringBuffer buffer) {
    super.writeProperties(buffer);

    if (union != null || subjectIsUnionBase) {
      final name = union?.cleanName ?? subject.cleanName;
      buffer
        ..writeln()
        ..writeln('@override')
        ..writeln(
          "String get \$${name}Type => '${subject.name}';",
        );
    }
  }

  @override
  void constructor(StringBuffer buffer) {
    if (subjectIsOfUnion) {
      buffer
        ..writeAll(
          union!.constructors.map<String>((superConst) {
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
