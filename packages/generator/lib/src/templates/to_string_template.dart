import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/field.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on List<Field> {
  Iterable<String> asArgs({bool withInstance = false}) {
    final args = <String>[];
    final access = withInstance ? 'instance.' : '';

    for (final field in this) {
      final arg = '${field.name}: \${$access${field.name}}';

      args.add(arg);
    }

    return args;
  }
}

/// {@template to_string_template}
/// Generates a toString method for the Class and its fields.
/// {@endtemplate}
class ToStringTemplate extends Template {
  /// {@macro to_string_template}
  const ToStringTemplate.forSubject(Class subject)
      : super(
          subject,
          name: IceOptions.tostring,
        );

  @override
  void generate(StringBuffer buffer) {
    _writeAsOverride(buffer);
    // _writeAsPrivateFunction(buffer);
  }

  void _writeAsOverride(StringBuffer buffer) {
    buffer
      ..writeln('@override')
      ..writeObject(
        'String toString()',
        body: () {
          _writeReturn(buffer);
        },
      );
  }

  void _writeAsPrivateFunction(StringBuffer buffer) {
    final genName = subject.genName;

    buffer.writeObject(
      'String _\$${subject.cleanName}ToString($genName instance)',
      body: () {
        _writeReturn(buffer, withInstance: true);
      },
    );
  }

  void _writeReturn(StringBuffer buffer, {bool withInstance = false}) {
    final genName = subject.genName;

    buffer
      ..write("return '$genName{")
      ..writeAll(subject.fields.asArgs(withInstance: withInstance), ', ')
      ..writeln("}';");
  }
}
