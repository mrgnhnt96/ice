import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/field.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on Iterable<Field> {
  Iterable<String> asArgs() {
    final args = <String>[];

    for (final field in this) {
      final arg = '${field.name}: \$${field.name}';

      args.add(arg);
    }

    return args;
  }
}

/// {@template to_string_template}
/// Generates a iceToString method for the Class and its fields.
/// {@endtemplate}
class ToStringTemplate extends Template {
  /// {@macro to_string_template}
  const ToStringTemplate.forSubject(
    Class subject, {
    required this.asExtension,
    this.union,
  }) : super(
          subject,
          templateType: TemplateType.iceToString,
        );

  /// whether to generate the method as a function
  ///
  /// if false, it will be generated as an override method
  final bool asExtension;

  /// the base union of the class
  final Class? union;

  @override
  void generate(StringBuffer buffer) {
    if (asExtension) {
      _writeAsExtension(buffer);
      return;
    }

    _writeAsOverride(buffer);
  }

  void _writeAsExtension(StringBuffer buffer) {
    buffer.writeObject(
      r'String _$toString()',
      body: () {
        _writeReturn(buffer);
      },
    );
  }

  void _writeAsOverride(StringBuffer buffer) {
    buffer
      ..write('@override ')
      ..writeObject(
        'String toString()',
        body: () {
          _writeReturn(buffer);
        },
      );
  }

  void _writeReturn(StringBuffer buffer) {
    final args = subject.fields.asArgs();

    var unionStr = '';

    if (union != null) {
      unionStr = '${union?.name}.';
    }

    if (args.isEmpty) {
      buffer.write("return r'$unionStr${subject.name}()';");
      return;
    }

    buffer.writepln(
      "return r'$unionStr${subject.name}(''${args.join(", ''")})';",
    );
  }
}
