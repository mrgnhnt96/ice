import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

/// {@template props_template}
/// A template that generates a method for the props getter.
/// {@endtemplate}
class PropsTemplate extends Template {
  /// {@macro props_template}
  const PropsTemplate.forSubject(Class subject)
      : super(subject, name: IceOptions.equatable);

  @override
  void generate(StringBuffer buffer) {
    _writeAsOverride(buffer);
    // _writeAsPrivateFunction(buffer);
  }

  void _writeAsOverride(StringBuffer buffer) {
    buffer
      ..writeln('@override')
      ..writeObject(
        'List<Object?> get props',
        body: () {
          _writeReturn(buffer);
        },
      );
  }

  void _writeAsPrivateFunction(StringBuffer buffer) {
    final genName = subject.genName;

    buffer.writeObject(
      'List<Object?> _\$${subject.cleanName}Props($genName instance)',
      body: () {
        _writeReturn(buffer, withInstance: true);
      },
    );
  }

  void _writeReturn(StringBuffer buffer, {bool withInstance = false}) {
    buffer
      ..write('return [')
      ..writeAll(
        subject.fields.map<String>((e) {
          if (withInstance) {
            return 'instance.${e.name}';
          }

          return e.name;
        }),
        ', ',
      )
      ..writeln('];');
  }
}
