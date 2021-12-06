import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/field.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on List<Field> {
  Iterable<String> asArgs() {
    final args = <String>[];

    for (final field in this) {
      final arg = '${field.name}: ${field.name}';

      args.add(arg);
    }

    return args;
  }
}

class ToStringTemplate extends Template {
  const ToStringTemplate.forSubject(Class subject) : super(subject);

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
    final genClassName = subject.generatedName(retainPrivate: false);

    buffer.writeObject(
      'String _${genClassName}ToString()',
      body: () {
        _writeReturn(buffer);
      },
    );
  }

  void _writeReturn(StringBuffer buffer) {
    final genClassName = subject.generatedName();

    buffer
      ..write("return '$genClassName{")
      ..writeAll(subject.fields.asArgs(), ', ')
      ..writeln("}';");
  }

  @override
  String toString() {
    final buffer = StringBuffer();

    _writeAsOverride(buffer);

    return buffer.toString();
  }

  @override
  void addToBuffer(StringBuffer buffer, {bool asOverride = true}) {
    if (asOverride) {
      _writeAsOverride(buffer);
    } else {
      _writeAsPrivateFunction(buffer);
    }
  }
}
