// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_template.dart';
import 'package:ice/src/templates/props_template.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/templates/to_json_template.dart';
import 'package:ice/src/templates/to_string_template.dart';
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
class IceTemplate extends Template {
  const IceTemplate.forSubject(Class subject) : super.wrapper(subject);

  @override
  void generate(StringBuffer buffer) {
    buffer.writeObject(
      subject.classEntry,
      body: () {
        buffer
          ..writeln('const ${subject.genName}();')
          ..writeln()
          ..writeAll(subject.fieldGetters, '\n');

        CopyWithTemplate.forSubject(subject, asExtension: false)
            .addToBuffer(buffer);

        PropsTemplate.forSubject(subject).addToBuffer(buffer);

        ToJsonTemplate.forSubject(subject).addToBuffer(buffer);

        ToStringTemplate.forSubject(subject).addToBuffer(buffer);
      },
    );
  }
}
