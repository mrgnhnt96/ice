// ignore_for_file: dead_code

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/position_type.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on Class {
  String get extension {
    return 'extension \$${name}X on $name';
  }

  String get copyWithInterfaceName {
    final genClassName = generatedName();
    return '\$${genClassName}CopyWith';
  }

  String get copyWithNameImpl {
    final name = copyWithInterfaceName;

    return '${name}Impl';
  }
}

extension on Constructor {
  Iterable<String> parameters() {
    return _parameters((p) => p.forConstructor());
  }

  Iterable<String> objectParameters() {
    return _parameters((p) => p.forConstructorAsObject());
  }

  Iterable<String> argumentsWithDefault() {
    return _parameters((p) => p.asArgumentWithDefault());
  }

  Iterable<String> _parameters(String Function(Param) toString) {
    return params.map((p) {
      final param = '${toString(p)},\n';

      return param;
    });
  }
}

extension on Param {
  String forConstructor() {
    return '$nullableType $name';
  }

  String forConstructorAsObject() {
    return 'Object? $name = kCopyWithDefault';
  }

  String asArgumentWithDefault() {
    final named = positionType.isNamed ? '$name: ' : '';
    return '$named$name == kCopyWithDefault ? _value.$name : $name as $type';
  }
}

/// {@template copy_with_method}
/// Generates a copyWith method for a class.
/// {@endtemplate}
class CopyWithTypeSafeTemplate extends Template {
  /// {@macro copy_with_method}
  CopyWithTypeSafeTemplate.forSubject(Class subject)
      : _entry = subject.copyWithConstructor(),
        super(
          subject,
          name: IceOptions.copyWithNullable,
        );

  /// receives the Constructor? from the subject
  ///
  /// if null, this CopyWith method is not generated
  /// if not null, [entry] will be assigned the value of [_entry]
  final Constructor? _entry;

  /// the constructor entry for copywith
  late final Constructor entry;

  void _writeCopyWith(
    StringBuffer buffer,
  ) {
    if (entry.params.isEmpty) {
      final genClassName = subject.generatedName();

      buffer.writeln('$genClassName copyWith() => $genClassName();');

      return;
    }

    final interface = subject.copyWithInterfaceName;
    final impl = subject.copyWithNameImpl;

    buffer
      ..writeln('// @JsonKey(ignore: true)')
      ..writeln('$interface get copyWith => $impl(this);');
  }

  void _writeCopyClasses(StringBuffer buffer) {
    if (entry.params.isEmpty) {
      return;
    }

    final interfaceName = subject.copyWithInterfaceName;
    final genClassName = subject.generatedName();

    _writeInterface(
      buffer,
      interfaceName: interfaceName,
      returnType: genClassName,
      entry: entry,
    );

    final implName = subject.copyWithNameImpl;

    _writeImplementation(
      buffer,
      interfaceName: interfaceName,
      implName: implName,
      returnType: genClassName,
      entry: entry,
    );
  }

  void _writeInterface(
    StringBuffer buffer, {
    required String interfaceName,
    required String returnType,
    required Constructor entry,
  }) {
    buffer
      ..writeObject(
        'abstract class $interfaceName',
        body: () {
          buffer
            ..writeln('const $interfaceName();')
            ..writeln('$returnType call({${entry.parameters().join()}});');
        },
      )
      ..writeln();
  }

  void _writeImplementation(
    StringBuffer buffer, {
    required String interfaceName,
    required String implName,
    required String returnType,
    required Constructor entry,
  }) {
    buffer.writeObject(
      'class $implName extends $interfaceName',
      body: () {
        buffer
          ..writeln(
            'const $implName(this._value);',
          )
          ..writeln()
          ..writeln('final $returnType _value;')
          ..writeln()
          ..writeln('@override')
          ..writeMethod(
            '$returnType call',
            params: entry.objectParameters(),
            separator: '',
            body: () {
              buffer.writeObject(
                'return $returnType',
                open: '(',
                body: () {
                  buffer.writeAll(entry.argumentsWithDefault());
                },
                close: ');',
              );
            },
          )
          ..writeln();
      },
    );
  }

  @override
  String toString() {
    if (_entry == null) {
      return '';
    }
    entry = _entry!;

    if (!canBeGenerated) {
      return '';
    }

    final buffer = StringBuffer();

    _writeCopyWith(buffer);

    return buffer.toString();
  }

  @override
  void addToBuffer(
    StringBuffer buffer, {
    bool wrapWithExtension = false,
    bool writeCopyClass = false,
  }) {
    if (_entry == null) {
      return;
    }
    entry = _entry!;

    if (!canBeGenerated) {
      return;
    }

    if (writeCopyClass) {
      _writeCopyClasses(buffer);

      return;
    }

    if (wrapWithExtension) {
      buffer.writeObject(
        subject.extension,
        body: () {
          _writeCopyWith(buffer);
        },
      );

      return;
    }

    _writeCopyWith(buffer);
  }
}
