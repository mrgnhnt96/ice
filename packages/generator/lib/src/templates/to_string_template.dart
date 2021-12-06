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
    final privateGenClassName = subject.generatedName(
      retainPrivate: false,
      throwOnNameFormat: false,
    );

    final genClassName = subject.generatedName(
      throwOnNameFormat: false,
    );

    buffer.writeObject(
      'String _\$${privateGenClassName}ToString($genClassName instance)',
      body: () {
        _writeReturn(buffer, withInstance: true);
      },
    );
  }

  void _writeReturn(StringBuffer buffer, {bool withInstance = false}) {
    final genClassName = subject.generatedName();

    buffer
      ..write("return '$genClassName{")
      ..writeAll(subject.fields.asArgs(withInstance: withInstance), ', ')
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
