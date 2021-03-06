// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on Class {
  Iterable<String> get fieldGetters {
    final getters = <String>[];

    for (final field in fields) {
      getters.add('${field.type} get ${field.name};');
    }

    return getters;
  }
}

class ToJsonTemplate extends Template {
  const ToJsonTemplate.forSubject(Class subject, [this.union])
      : unions = const [],
        super(subject, templateType: TemplateType.toJson);

  const ToJsonTemplate.forUnion(Class subject, this.unions)
      : union = null,
        super(subject, templateType: TemplateType.toJson);

  final Iterable<Class> unions;
  final Class? union;

  void _writeAsUnionBase(StringBuffer buffer) {
    buffer.writeObject(
      'Map<String, dynamic> toJson({bool includeUnionType = true})',
      body: () {
        buffer.writeObject(
          'switch(runtimeType)',
          body: () {
            for (final union in unions) {
              buffer
                ..writepln('case ${union.name}:')
                ..writepln(
                  // ignore: missing_whitespace_between_adjacent_strings
                  'return (this as ${union.name})'
                  '.toJson(includeUnionType: includeUnionType);',
                );
            }

            buffer
              ..writepln('default:')
              ..writepln('throw FallThroughError();');
          },
        );
      },
    );
  }

  void _writeAsSubclass(StringBuffer buffer) {
    final unionId = subject.annotations.union!.unionId ?? subject.name;
    final unionKey = union?.annotations.union!.unionKey ?? r'$unionType';

    buffer.writeObject(
      'Map<String, dynamic> toJson({bool includeUnionType = true})',
      body: () {
        var returnType = '_\$\$${subject.cleanName}ToJson';

        if (subject.annotations.isContainedUnion) {
          returnType = '_\$${subject.cleanName}ToJson';
        }

        buffer
          ..writepln(
            'final map = $returnType(this);',
          )
          ..writeObject(
            'if (includeUnionType)',
            body: () {
              buffer.writepln("map[r'$unionKey'] = r'$unionId';");
            },
          )
          ..writepln('return map;');
      },
    );
  }

  void _writeToJson(StringBuffer buffer) {
    final writeAsGeneratedJson = subject.metaSettings(
      methodCallback: (method) => false,
      iceCallback: (ice) => true,
      settingsCallback: (settings) => true,
    );

    var genSign = r'$';
    if (writeAsGeneratedJson) {
      genSign += r'$';
    }

    buffer.writepln(
      'Map<String, dynamic> toJson() => '
      '_$genSign${subject.nonPrivateName}ToJson(this);',
    );
  }

  @override
  bool get canBeGenerated {
    return super.canBeGenerated;
    // ! TODO(mrgnhnt96): check if all/any fields have toJson()
    // ! without this check, an infinite loop can occur
    // if (!super.canBeGenerated) {
    //   return false;
    // }

    // if (subject.annotations.isUnionBase) {
    //   if (unions.isNotEmpty) {
    //     return true;
    //   }
    // }
  }

  @override
  void generate(StringBuffer buffer) {
    if (subject.annotations.isUnionBase) {
      if (unions.isNotEmpty) {
        _writeAsUnionBase(buffer);
      }
    } else if (subject.annotations.isSubUnion) {
      _writeAsSubclass(buffer);
    } else {
      _writeToJson(buffer);
    }
  }
}
