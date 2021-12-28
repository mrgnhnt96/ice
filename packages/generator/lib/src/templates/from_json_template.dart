// ignore_for_file: unused_field, public_member_api_docs

import 'package:build/build.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/iterable_ext.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on Class {
  Iterable<String> get fieldGetters {
    final getters = <String>[];

    for (final field in fields) {
      getters.add('${field.type} get ${field.name};');
    }

    return getters;
  }

  Constructor? get fromJsonConstructor {
    if (constructors.isEmpty) {
      return null;
    }

    final ctor = constructors.firstWhereOrNull<Constructor>(
      (e) => e.isDefault,
    );

    return ctor ?? constructors.first;
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

  void writeConstructor(StringBuffer buffer) {
    if (subject.doNotGenerate.fromJsonConstructor || !canBeGenerated) {
      return;
    }

    final constructor = subject.fromJsonConstructor;

    if (constructor == null) {
      log.info(
        'this class has no constructors, but it should because '
        'we need to get the default constructor',
      );
      return;
    }

    buffer.writeln(
      'factory ${subject.genName}'
      '.fromJson(Map<String, dynamic> json) => '
      '_\$\$${subject.name}FromJson(json);',
    );
  }

  void _writeAsUnion(StringBuffer buffer) {
    buffer.writeObject(
      '${subject.name} _\$${subject.name}FromJson(Map<String, dynamic> json, '
      '[${subject.name}? defaultValue])',
      body: () {
        final unionTypeKey = subject.annotations.union!.unionTypeKey;
        buffer.writeObject(
          "switch(json[r'$unionTypeKey'] as String?)",
          body: () {
            for (final union in unions) {
              var fromJsonAccess = union.name;
              final unionTypeId =
                  union.annotations.union!.unionTypeId ?? union.name;

              if (!union.doNotGenerate.fromJsonConstructor) {
                fromJsonAccess = union.genName;
              }
              buffer
                ..writeln("case r'$unionTypeId':")
                ..writeln('return $fromJsonAccess.fromJson(json);');
            }

            buffer
              ..writeln('default:')
              ..writeObject(
                'if (defaultValue != null)',
                body: () {
                  buffer.writeln('return defaultValue;');
                },
              )
              ..writeln('throw FallThroughError();');
          },
        );
      },
    );
  }

  void _writeFromJson(StringBuffer buffer) {
    if (!subject.doNotGenerate.fromJsonConstructor) {
      return;
    }

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
