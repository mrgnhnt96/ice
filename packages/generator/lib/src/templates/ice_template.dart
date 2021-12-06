// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:ice/src/templates/copy_with_template.dart';
import 'package:ice/src/templates/props_template.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/templates/to_string_template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on Class {
  String className() {
    final keyword = isAbstract ? 'abstract class' : 'class';

    return '$keyword ${generatedName()} extends $name with EquatableMixin';
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

/// A template to generate methods for
/// - copyWith()
/// - Equatable Props
/// - toString()
class IceTemplate extends Template {
  const IceTemplate.forSubject(Class subject) : super(subject);

  @override
  String toString() {
    final buffer = StringBuffer();
    final cls = subject;

    final genClassName = cls.generatedName(throwOnNameFormat: true);
    final nonPrivategGenClassName = cls.generatedName(retainPrivate: false);

    final toStringTemplate = ToStringTemplate.forSubject(subject);
    final propsTemplate = PropsTemplate.forSubject(subject);
    final copyWithTemplate = CopyWithTemplate.forSubject(subject);

    buffer
      ..writeln('@JsonSerializable()')
      ..writeObject(
        cls.className(),
        body: () {
          buffer
            ..writeAll(cls.constructors.declarations(genClassName))
            ..writeln(
              'factory $genClassName.fromJson(Map<String, dynamic> json) => '
              '_\$${nonPrivategGenClassName}FromJson(json);',
            )
            ..writeln()
            ..writeln(
              'Map<String, dynamic> toJson() => '
              '_\$${nonPrivategGenClassName}ToJson(this);',
            )
            ..writeln();

          toStringTemplate.addToBuffer(buffer);

          buffer.writeln();

          propsTemplate.addToBuffer(buffer);

          buffer.writeln();

          copyWithTemplate.addToBuffer(buffer);
        },
      );

    return buffer.toString();
  }

  @override
  void addToBuffer(StringBuffer buffer) {
    // TODO: implement addToBuffer
  }
}
