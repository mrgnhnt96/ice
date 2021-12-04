// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:ice/src/domain/field.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on Class {
  String className() {
    return 'class ${getName()} extends $name with EquatableMixin';
  }

  String getName() {
    final startsWithPrivate = name.startsWith('_');
    final startsWithDollar = name.startsWith(r'$');
    final startsWithPrivateDollar = name.startsWith(r'_$');

    final mustBePrivateException = Exception(
      'Class name $name must start with \$ to '
      'successfully generate as a private class',
    );

    if (genAsPrivate && (!startsWithDollar || !startsWithPrivateDollar)) {
      throw mustBePrivateException;
    }

    if (genAsPrivate && startsWithPrivate) {
      throw mustBePrivateException;
    }

    final cleanName = name.replaceAll(r'$', '').replaceAll('_', '');

    if (genAsPrivate) {
      return '_$cleanName';
    }

    return cleanName;
  }
}

extension on Param {
  String superArg() {
    return positionType.map(
      named: '$name: $name',
      positioned: name,
    );
  }
}

extension on Constructor {
  String arguments() {
    var entryPoint = '';

    if (!isDefault) {
      entryPoint = '.$name';
    }

    final args = <String>{}
      ..add('super$entryPoint(')
      ..addAll(params.map((e) => '${e.superArg()},'))
      ..add(');');

    if (args.length > 2) {
      return args.join(' ');
    }

    return args.join();
  }
}

extension on List<Constructor> {
  Iterable<String> declarations(String genClassName) {
    final declarations = <String>[];

    for (final constructor in this) {
      final declaration = '$genClassName${constructor.declaration} : '
          '${constructor.arguments()}\n\n';

      declarations.add(declaration);
    }

    return declarations;
  }
}

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

/// A template to generate methods for
/// - copyWith()
/// - Equatable Props
/// - toString()
class IceTemplate {
  const IceTemplate.forSubject(Class subject) : _subject = subject;

  final Class _subject;

  @override
  String toString() {
    final buffer = StringBuffer();
    final cls = _subject;

    final genClassName = cls.getName();

    buffer
      ..writeln('@JsonSerializable()')
      ..writeObject(
        cls.className(),
        body: (classBuf, classTab) {
          classBuf
            ..writeAll(cls.constructors.declarations(genClassName))
            ..writeln(
              'factory $genClassName.fromJson(Map<String, dynamic> json) => '
              '_\$${genClassName}FromJson(json);',
            )
            ..writeln()
            ..writeln(
              'Map<String, dynamic> toJson() => '
              '_\$${genClassName}ToJson(this);',
            )
            ..writeln()
            ..writeln('@override')
            ..writeObject(
              'String toString()',
              body: (strBuf, strTab) {
                strBuf
                  ..write("return '${cls.name}{")
                  ..writeAll(cls.fields.asArgs(), ', ')
                  ..writeln("}';");
              },
            )
            ..writeln()
            ..writeln('@override')
            ..writeObject(
              'List<Object?> get props',
              body: (strBuf, strTab) {
                strBuf
                  ..write('return [')
                  ..writeAll(cls.fields.map<String>((e) => e.name), ', ')
                  ..writeln('];');
              },
            );
        },
      );

    return buffer.toString();
  }
}
