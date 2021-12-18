import 'package:ice/src/domain/class.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_template.dart';
import 'package:ice/src/templates/templates.dart';
import 'package:ice/src/templates/to_json_template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

/// {@template method_template}
/// Writes the extensions and methods for the given class.
/// {@endtemplate}
class MethodTemplate extends Template {
  /// {@macro method_template}
  MethodTemplate.forSubject(Class subject) : super.wrapper(subject);

  @override
  void generate(StringBuffer buffer) {
    final methods = subject.annotations.methods;
    if (methods == null) return;

    final copyWithTemplate = CopyWithTemplate.forSubject(subject);

    buffer.writeObject(
      'extension on ${subject.name}',
      body: () {
        copyWithTemplate.addToBuffer(buffer);
        ToJsonTemplate.forSubject(subject).addToBuffer(buffer);
      },
    );

    copyWithTemplate.writeSupport(buffer);

    PropsTemplate.forSubject(
      subject,
      asFunction: true,
    ).addToBuffer(buffer);

    ToStringTemplate.forSubject(
      subject,
      asFunction: true,
    ).addToBuffer(buffer);
  }
}
