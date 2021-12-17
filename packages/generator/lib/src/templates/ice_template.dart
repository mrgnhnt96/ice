// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/copy_with_template.dart';
import 'package:ice/src/templates/copy_with_type_safe_template.dart';
import 'package:ice/src/templates/props_template.dart';
import 'package:ice/src/templates/template.dart';
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
    _writeClass(buffer);
  }

  void _writeClass(StringBuffer buffer) {
    CopyWithTypeSafeTemplate? copyWithTemplate;

    buffer.writeObject(
      subject.classEntry,
      body: () {
        buffer
          ..writeln('const ${subject.genName}();')
          ..writeln()
          ..writeAll(subject.fieldGetters, '\n');

        _writeProperties(buffer, (copyWith) {
          copyWithTemplate = copyWith;
        });
      },
    );

    copyWithTemplate?.addToBuffer(buffer);
  }

  void _writeProperties(
    StringBuffer buffer,
    Function(CopyWithTypeSafeTemplate) afterClass,
  ) {
    if (!subject.annotations.createToJson) {
      _writeSerializable(buffer);
    }

    if (subject.canGeneratedMethod(IceOptions.copyWithSimple)) {
      CopyWithTemplate.forSubject(subject).addToBuffer(buffer);
    }

    if (subject.canGeneratedMethod(IceOptions.copyWithNullable)) {
      final copyWithTemplate = CopyWithTypeSafeTemplate.forSubject(subject)
        ..addToBuffer(buffer);

      afterClass(copyWithTemplate);
    }

    if (subject.canGeneratedMethod(IceOptions.equatable)) {
      PropsTemplate.forSubject(subject).addToBuffer(buffer);
    }

    if (subject.canGeneratedMethod(IceOptions.tostring)) {
      ToStringTemplate.forSubject(subject).addToBuffer(buffer);
    }
  }

  void _writeSerializable(StringBuffer buffer) {
    if (subject.canGeneratedMethod(IceOptions.toJson)) {
      buffer
        ..writeln(
          'Map<String, dynamic> toJson() => '
          '_\$${subject.nonPrivateName}ToJson(this);',
        )
        ..writeln();
    }
  }
}
