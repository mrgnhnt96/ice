import 'package:ice/src/domain/class.dart';
import 'package:ice/src/templates/copy_with_template.dart';
import 'package:ice/src/templates/templates.dart';
import 'package:ice_annotation/ice.dart';

/// {@template method_template}
/// Writes the extensions and methods for the given class.
/// {@endtemplate}
class MethodTemplate extends Template {
  /// {@macro method_template}
  MethodTemplate.forSubject(Class subject) : super.wrapper(subject);

  void _getAndWriteMethods(StringBuffer buffer) {
    final methods = subject.annotations.methods;
    if (methods == null) {
      return;
    }

    if (methods.canGenerateCopyWith(CopyWithType.nullable)) {
      CopyWithTypeSafeTemplate.forSubject(subject)
          .addToBuffer(buffer, wrapWithExtension: true);
    }

    if (methods.canGenerateCopyWith(CopyWithType.simple)) {
      CopyWithTemplate.forSubject(subject).addToBuffer(buffer);
    }

    if (methods.hasProps) {
      PropsTemplate.forSubject(subject).addToBuffer(buffer, asOverride: false);
    }

    if (methods.hasToString) {
      ToStringTemplate.forSubject(subject)
          .addToBuffer(buffer, asOverride: false);
    }
  }

  @override
  String toString() {
    final buffer = StringBuffer();

    _getAndWriteMethods(buffer);

    return buffer.toString();
  }

  @override
  void addToBuffer(StringBuffer buffer) {
    _getAndWriteMethods(buffer);
  }
}
