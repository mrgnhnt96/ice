import 'package:ice/src/domain/class.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_template.dart';
import 'package:ice/src/templates/templates.dart';

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

    CopyWithTemplate.forSubject(subject, asExtension: true).addToBuffer(buffer);
    PropsTemplate.forSubject(subject).addToBuffer(buffer);
    ToStringTemplate.forSubject(subject).addToBuffer(buffer);
  }
}
