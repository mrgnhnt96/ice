import 'package:ice/src/domain/class.dart';
import 'package:ice/src/domain/enums/annotation_types.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/templates/templates.dart';

/// Writes the extensions and methods for the given class.
class ExtensionMethodTemplate extends Template {
  ExtensionMethodTemplate.forSubject(Class subject) : super(subject);

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
      buffer.writeln();
    }

    if (generateProps) {
      PropsTemplate.forSubject(subject).addToBuffer(buffer, asOverride: false);
      buffer.writeln();
    }

    if (generateToString) {
      ToStringTemplate.forSubject(subject)
          .addToBuffer(buffer, asOverride: false);
      buffer.writeln();
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
