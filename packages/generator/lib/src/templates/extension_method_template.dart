import 'package:ice/src/domain/class.dart';
import 'package:ice/src/domain/enums/annotation_types.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/templates/templates.dart';

/// {@template extension_method_template}
/// Writes the extensions and methods for the given class.
/// {@endtemplate}
class ExtensionMethodTemplate extends Template {
  /// {@macro extension_method_template}
  ExtensionMethodTemplate.forSubject(Class subject) : super.wrapper(subject);

  void _getAndWriteMethods(StringBuffer buffer) {
    var generateCopyWith = false;
    var generateProps = false;
    var generateToString = false;

    for (final annotation in subject.annotations) {
      final type = annotation.type;
      if (type.isCopyWith) {
        generateCopyWith = true;
      } else if (type.isProps) {
        generateProps = true;
      } else if (type.isString) {
        generateToString = true;
      }
    }

    if (generateCopyWith) {
      CopyWithTemplate.forSubject(subject)
          .addToBuffer(buffer, wrapWithExtension: true);
    }

    if (generateProps) {
      PropsTemplate.forSubject(subject).addToBuffer(buffer, asOverride: false);
    }

    if (generateToString) {
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
