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

/// A template to generate methods for
/// - copyWith()
/// - Equatable Props
/// - toString()
class ToJsonTemplate extends Template {
  const ToJsonTemplate.forSubject(Class subject, [this.union])
      : unions = const [],
        super(subject, name: IceOptions.toJson);

  const ToJsonTemplate.forUnion(Class subject, this.unions)
      : union = null,
        super(subject, name: IceOptions.toJson);

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
    final unionTypeId = subject.annotations.union!.unionTypeId ?? subject.name;
    final unionTypeKey =
        union?.annotations.union!.unionTypeKey ?? r'$unionType';

    buffer.writeObject(
      'Map<String, dynamic> toJson({bool includeUnionType = true})',
      body: () {
        buffer
          ..writepln(
            'final map = _\$\$${subject.nonPrivateName}ToJson(this);',
          )
          ..writeObject(
            'if (includeUnionType)',
            body: () {
              buffer.writepln("map[r'$unionTypeKey'] = r'$unionTypeId';");
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
    if (subject.annotations.isUnionBase) {
      if (unions.isNotEmpty) {
        // TODO(mrgnhnt96): check if all/any fields have toJson()
        return true;
      }
    }

    return super.canBeGenerated;
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
