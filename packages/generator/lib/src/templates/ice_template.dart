// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/enums.dart';
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
  const IceTemplate.forSubject(Class subject) : super(subject);

  void _writeProperties(StringBuffer buffer) {
    final genClassName = subject.generatedName();
    final nonPrivategGenClassName = subject.generatedName(retainPrivate: false);

    final toStringTemplate = ToStringTemplate.forSubject(subject);
    final propsTemplate = PropsTemplate.forSubject(subject);
    final copyWithTemplate = CopyWithTemplate.forSubject(subject);

    buffer
      ..writeln(
        'factory $genClassName.fromJson(Map<String, dynamic> json) => '
        '_\$${nonPrivategGenClassName}FromJson(json);',
      )
      ..writeln()
      ..writeln(
        'Map<String, dynamic> toJson() => '
        '_\$${nonPrivategGenClassName}ToJson(this);',
      )
      ..writeln();

    toStringTemplate.addToBuffer(buffer);

    buffer.writeln();

    propsTemplate.addToBuffer(buffer);

    buffer.writeln();

    copyWithTemplate.addToBuffer(buffer);
  }

  void _writeClass(StringBuffer buffer) {
    final genClassName = subject.generatedName(throwOnNameFormat: true);

    buffer
      ..writeln('@JsonSerializable()')
      ..writeObject(
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
