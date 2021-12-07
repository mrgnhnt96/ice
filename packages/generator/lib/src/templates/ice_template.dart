// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/copy_with_template.dart';
import 'package:ice/src/templates/props_template.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/templates/to_string_template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

/// A template to generate methods for
/// - copyWith()
/// - Equatable Props
/// - toString()
class IceTemplate extends Template {
  const IceTemplate.forSubject(Class subject) : super.wrapper(subject);

  void _writeSerializable(StringBuffer buffer) {
    final genClassName = subject.generatedName();
    final nonPrivategGenClassName = subject.generatedName(retainPrivate: false);

    if (subject.canGeneratedConstructor('fromJson')) {
      buffer.writeln(
        'factory $genClassName.fromJson(Map<String, dynamic> json) => '
        '_\$${nonPrivategGenClassName}FromJson(json);',
      );
    }

    if (subject.canGeneratedMethod('toJson')) {
      buffer.writeln(
        'Map<String, dynamic> toJson() => '
        '_\$${nonPrivategGenClassName}ToJson(this);',
      );
    }
  }

  void _writeProperties(StringBuffer buffer) {
    if (!subject.isAbstract) {
      _writeSerializable(buffer);
    }

    ToStringTemplate.forSubject(subject).addToBuffer(buffer);
    PropsTemplate.forSubject(subject).addToBuffer(buffer);
    CopyWithTemplate.forSubject(subject).addToBuffer(buffer);
  }

  void _writeClass(StringBuffer buffer) {
    final genClassName = subject.generatedName(throwOnNameFormat: true);

    if (!subject.isAbstract) {
      buffer.writeln('@JsonSerializable()');
    }
    buffer.writeObject(
      subject.classEntry,
      body: () {
        buffer.writeAll(subject.constructors.declarations(genClassName));
        _writeProperties(buffer);
      },
    );
  }

  @override
  String toString() {
    final buffer = StringBuffer();

    _writeClass(buffer);

    return buffer.toString();
  }

  @override
  void addToBuffer(StringBuffer buffer, {bool wrapInClass = true}) {
    if (wrapInClass) {
      _writeClass(buffer);
    } else {
      _writeProperties(buffer);
    }
  }
}
