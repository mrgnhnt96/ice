import 'package:ice/src/domain/class.dart';
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
    final toJsonTemplate = ToJsonTemplate.forSubject(subject);

    if (toJsonTemplate.canBeGenerated || copyWithTemplate.canBeGenerated) {
      buffer.writeObject(
        'extension \$${subject.cleanName}X on ${subject.name}',
        body: () {
          copyWithTemplate.addToBuffer(buffer);

          toJsonTemplate.addToBuffer(buffer);

          PropsTemplate.forSubject(
            subject,
            asExtension: true,
          ).addToBuffer(buffer);

          ToStringTemplate.forSubject(
            subject,
            asExtension: true,
          ).addToBuffer(buffer);
        },
      );
    }

    if (copyWithTemplate.support.isNotEmpty) {
      buffer
        ..writeln(copyWithTemplate.support)
        ..writeln();
    }
  }
}
