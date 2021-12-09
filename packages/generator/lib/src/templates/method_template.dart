import 'package:ice/src/domain/class.dart';
import 'package:ice/src/domain/enums/annotation_types.dart';
import 'package:ice/src/templates/templates.dart';

/// {@template method_template}
/// Writes the extensions and methods for the given class.
/// {@endtemplate}
class MethodTemplate extends Template {
  /// {@macro method_template}
  MethodTemplate.forSubject(Class subject) : super.wrapper(subject);

  void _getAndWriteMethods(StringBuffer buffer) {
    var hasCopyWithAnnotation = false;
    var hasPropsAnnotation = false;
    var hasToStringAnnotation = false;

    for (final annotation in subject.annotations) {
      final type = annotation.type;
      if (type.isCopyWith) {
        hasCopyWithAnnotation = true;
      } else if (type.isProps) {
        hasPropsAnnotation = true;
      } else if (type.isString) {
        hasToStringAnnotation = true;
      }
    }

    if (hasCopyWithAnnotation) {
      CopyWithTemplate.forSubject(subject)
          .addToBuffer(buffer, wrapWithExtension: true);
    }

    if (hasPropsAnnotation) {
      PropsTemplate.forSubject(subject).addToBuffer(buffer, asOverride: false);
    }

    if (hasToStringAnnotation) {
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
