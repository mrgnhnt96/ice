// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/enums.dart';
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
class ToJsonTemplate extends Template {
  const ToJsonTemplate.forSubject(Class subject)
      : super(subject, name: IceOptions.toJson);

  void _writeSerializable(StringBuffer buffer) {
    buffer.writeln(
      'Map<String, dynamic> toJson() => '
      '_\$${subject.nonPrivateName}ToJson(this);',
    );
  }

  @override
  void generate(StringBuffer buffer) {
    _writeSerializable(buffer);
  }
}
