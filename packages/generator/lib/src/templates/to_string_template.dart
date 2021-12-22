import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/field.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on List<Field> {
  Iterable<String> asArgs({bool fromInstance = false}) {
    final args = <String>[];

    for (final field in this) {
      final arg =
          '\t${field.name}: \$${field.value(fromInstance: fromInstance)}';

      args.add(arg);
    }

    return args;
  }
}

extension on Field {
  String value({required bool fromInstance}) {
    if (fromInstance) {
      return '{instance.$name}';
    }

    return name;
  }
}

/// {@template to_string_template}
/// Generates a iceToString method for the Class and its fields.
/// {@endtemplate}
class ToStringTemplate extends Template {
  /// {@macro to_string_template}
  const ToStringTemplate.forSubject(
    Class subject, {
    required this.asFunction,
  }) : super(
          subject,
          name: IceOptions.iceToString,
        );

  /// whether to generate the method as a function
  ///
  /// if false, it will be generated as an override method
  final bool asFunction;

  @override
  void generate(StringBuffer buffer) {
    if (asFunction) {
      _writeAsFuntion(buffer);
      return;
    }

    _writeAsOverride(buffer);
  }

  void _writeAsFuntion(StringBuffer buffer) {
    buffer.writeObject(
      'String _\$${subject.cleanName}ToString(${subject.name} instance)',
      body: () {
        _writeReturn(buffer, fromInstance: true);
      },
    );
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

  void _writeReturn(StringBuffer buffer, {bool fromInstance = false}) {
    final args = subject.fields.asArgs(fromInstance: fromInstance);

    if (args.isEmpty) {
      buffer.write("return '${subject.name}()';");
      return;
    }

    buffer
      ..writeln("return '''\n${subject.name}(")
      ..writeAll(args, ',\n')
      ..writeln(',')
      ..writeln(")''';");
  }
}
