import 'package:ice/src/domain/class.dart';
import 'package:ice/src/domain/enums/annotation_types.dart';
import 'package:ice/src/templates/copy_with_template.dart';
import 'package:ice/src/templates/templates.dart';

/// {@template method_template}
/// Writes the extensions and methods for the given class.
/// {@endtemplate}
class MethodTemplate extends Template {
  /// {@macro method_template}
  MethodTemplate.forSubject(Class subject) : super.wrapper(subject);

  void _getAndWriteMethods(StringBuffer buffer) {
    var generateCopyWith = false;
    var generateCopyWithNullable = false;
    var generateProps = false;
    var generateToString = false;

    for (final annotation in subject.annotations) {
      final type = annotation.type;
      if (type.isOther) continue;

      type.maybeMap(
        copyWith: () {
          generateCopyWith = true;
        },
        props: () {
          generateProps = true;
        },
        copyWithTypeSafe: () {
          generateCopyWithNullable = true;
        },
        string: () {
          generateToString = true;
        },
        orElse: () {},
      )();
    }

    if (generateCopyWith || generateCopyWithNullable) {
      if (generateCopyWithNullable) {
        CopyWithTypeSafeTemplate.forSubject(subject)
            .addToBuffer(buffer, wrapWithExtension: true);
      } else {
        CopyWithTemplate.forSubject(subject).addToBuffer(buffer);
      }
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
