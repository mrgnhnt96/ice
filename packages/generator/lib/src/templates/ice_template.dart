// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_template.dart';
import 'package:ice/src/templates/props_template.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/templates/to_json_template.dart';
import 'package:ice/src/templates/to_string_template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on Class {
  String get classHeader {
    final hasEquatable = metaSettings(
      methodCallback: (_) => false,
      iceCallback: (settings) => settings.equatable,
      settingsCallback: (settings) => settings.equatable,
    );
    var mixins = '';

    if (hasEquatable) {
      mixins = ' with EquatableMixin';
    }
    return 'abstract class $genName$mixins';
  }
}

/// A template to generate methods for
/// - copyWith()
/// - Equatable Props
/// - toString()
class IceTemplate extends Template {
  const IceTemplate.forSubject(
    Class subject, {
    required this.union,
  }) : super.wrapper(subject);

  final Class? union;

  bool get isOfUnion => union != null;
  bool get isUnionBase => subject.annotations.isUnionBase;

  @override
  void generate(StringBuffer buffer) {
    final copyWithTemplate = CopyWithTemplate.forSubject(subject);

    buffer.writeObject(
      subject.classHeader,
      body: () {
        buffer
          ..writeln('const ${subject.genName}();')
          ..writeln()
          ..writeAll(subject.fieldGetters, '\n')
          ..writeln('\n');

        copyWithTemplate.addToBuffer(buffer);
        buffer.writeln();

        PropsTemplate.forSubject(
          subject,
          asFunction: false,
        ).addToBuffer(buffer);
        buffer.writeln();

        ToStringTemplate.forSubject(
          subject,
          asFunction: false,
        ).addToBuffer(buffer);
      },
    );

    copyWithTemplate.writeSupport(buffer);

    buffer
      ..writeObject(
        'extension on ${subject.name}',
        body: () {
          ToJsonTemplate.forSubject(subject).addToBuffer(buffer);
        },
      )
      ..writeln();
  }
}
