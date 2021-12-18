import 'package:ice/ice.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/field.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

/// {@template props_template}
/// A template that generates a method for the props getter.
/// {@endtemplate}
class PropsTemplate extends Template {
  /// {@macro props_template}
  const PropsTemplate.forSubject(
    Class subject, {
    required this.asFunction,
  }) : super(subject, name: IceOptions.equatable);

  /// whether to generate the props as a function
  final bool asFunction;

  @override
  void generate(StringBuffer buffer) {
    if (asFunction) {
      _writeAsFunction(buffer);
      return;
    }

    _writeAsOverride(buffer);
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

  void _writeAsFunction(StringBuffer buffer) {
    buffer.writeObject(
      'List<Object?> _\$${subject.cleanName}Props(${subject.name} instance)',
      body: () {
        _writeReturn(buffer, withInstance: true);
      },
    );
  }

  void _writeReturn(StringBuffer buffer, {bool withInstance = false}) {
    buffer
      ..write('return [')
      ..writeAll(
        subject.fields.returnProps(withInstance: withInstance),
        ', ',
      )
      ..writeln('];');
  }
}

extension on List<Field> {
  Iterable<String> returnProps({bool withInstance = false}) {
    final props = <String>[];

    for (final field in this) {
      if (field.includeInProps) {
        if (withInstance) {
          props.add('instance.${field.name}');
          continue;
        }

        props.add(field.name);
      }
    }

    return props;
  }
}
