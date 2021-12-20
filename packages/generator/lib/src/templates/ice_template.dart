// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/position_type.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_template.dart';
import 'package:ice/src/templates/props_template.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/templates/to_json_template.dart';
import 'package:ice/src/templates/to_string_template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

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
class IceTemplate extends Template {
  const IceTemplate.forSubject(
    Class subject, {
    this.union,
  }) : super.wrapper(subject);

  final Class? union;

  bool get subjectIsOfUnion => union != null;
  bool get subjectIsUnionBase => subject.annotations.isUnionBase;
  bool get generateMeta =>
      subject.annotations.ice != null || subjectIsUnionBase;

  @override
  void generate(StringBuffer buffer) {
    final copyWithTemplate = CopyWithTemplate.forSubject(subject);

    if (subjectIsUnionBase) {
      buffer.writeObject(
        'abstract class ${subject.baseName}',
        body: () {
          buffer
            ..writeln('const ${subject.baseName}();')
            ..writeln()
            ..writeln('String get \$${subject.cleanName}Type;');
        },
      );
    }

    buffer.writeObject(
      subject.classHeader(union),
      body: () {
        // constructors
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

        // fields
        buffer
          ..writeAll(subject.fieldGetters, '\n')
          ..writeln('\n');

        if (generateMeta) {
          copyWithTemplate.addToBuffer(buffer);
          buffer.writeln();

          PropsTemplate.forSubject(
            subject,
            union: union,
            asFunction: false,
          ).addToBuffer(buffer);
          buffer.writeln();

          ToStringTemplate.forSubject(
            subject,
            asFunction: false,
          ).addToBuffer(buffer);
          buffer.writeln();
        }

        if (union != null || subjectIsUnionBase) {
          final name = union?.cleanName ?? subject.cleanName;
          buffer
            ..writeln()
            ..writeln('@override')
            ..writeln(
              "String get \$${name}Type => '${subject.name}';",
            )
            ..writeln();
        }
      },
    );

    if (generateMeta) {
      copyWithTemplate.writeSupport(buffer);
    }

    final toJsonTemplate = ToJsonTemplate.forSubject(subject);

    if (toJsonTemplate.canBeGenerated) {
      buffer
        ..writeObject(
          'extension on ${subject.name}',
          body: () {
            toJsonTemplate.addToBuffer(buffer);
          },
        )
        ..writeln();
    }
  }
}
