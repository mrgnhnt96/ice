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
    required this.asExtension,
    this.union,
  }) : super(subject, name: IceOptions.equatable);

  /// whether to generate the props as a function
  final bool asExtension;

  /// the union of the [subject]
  final Class? union;

  @override
  void generate(StringBuffer buffer) {
    if (asExtension) {
      _writeAsExtension(buffer);
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

  void _writeAsExtension(StringBuffer buffer) {
    buffer.writeObject(
      r'List<Object?> get _$props',
      body: () {
        _writeReturn(buffer);
      },
    );
  }

  void _writeReturn(StringBuffer buffer) {
    final unionFields = union?.fields.returnProps() ?? [];
    final fields = subject.fields.returnProps();

    final allFields = [
      ...fields,
      ...unionFields,
    ];

    if (allFields.isEmpty) {
      buffer.write('return [];');
      return;
    }

    buffer
      ..write('return [')
      ..writeAll(allFields, ', ')
      ..writeln('];');
  }
}

extension on List<Field> {
  Iterable<String> returnProps() {
    final props = <String>[];

    for (final field in this) {
      if (field.includeInProps) {
        props.add(field.name);
      }
    }

    return props;
  }
}
