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
class FromJsonTemplate extends Template {
  const FromJsonTemplate.forSubject(Class subject)
      : unions = const [],
        super(subject, name: IceOptions.fromJson);
  const FromJsonTemplate.forUnion(Class subject, this.unions)
      : super(subject, name: IceOptions.fromJson);

  final Iterable<Class> unions;

  void _writeAsUnion(StringBuffer buffer) {
    buffer.writeObject(
      '_\$${subject.name}FromJson(Map<String, dynamic> json)',
      body: () {
        buffer.writeObject(
          // TODO(mrgnhnt96): get unionType key
          r"switch(json[r'$unionType'] as String)",
          body: () {
            for (final union in unions) {
              buffer
                // TODO(mrgnhnt96): get unionType name for case
                ..writeln("case '${union.name}':")
                ..writeln('return ${union.name}.fromJson(json);');
            }

            buffer
              ..writeln('default:')
              ..writeln('throw FallThroughError();');
          },
        );
      },
    );
  }

  void _writeFromJson(StringBuffer buffer) {
    buffer.writeObject(
      // ignore: missing_whitespace_between_adjacent_strings
      '${subject.name} _\$${subject.nonPrivateName}FromJson'
      '(Map<String, dynamic> json)',
      body: () {
        buffer.writeln(
          'return _\$\$${subject.nonPrivateName}FromJson(json) '
          'as ${subject.name};',
        );
      },
    );
  }

  @override
  void generate(StringBuffer buffer) {
    if (subject.annotations.isUnionBase) {
      if (unions.isNotEmpty) {
        _writeAsUnion(buffer);
      }
    } else {
      _writeFromJson(buffer);
    }
  }
}
