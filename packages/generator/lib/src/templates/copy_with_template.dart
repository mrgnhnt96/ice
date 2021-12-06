import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/position_type.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on Class {
  String get extension {
    return 'extension ${name}X on $name';
  }

  String get copyWithSignature {
    return '$name copyWith';
  }

  String get privateCopyWithSignature {
    return '$name _copyWith';
  }

  String get returnObjectCopyWoth {
    return 'return _copyWith';
  }
}

extension on Constructor {
  Iterable<String> parameters() {
    return _parameters((p) => p.forConstructor());
  }

  Iterable<String> objectParameters() {
    return _parameters((p) => p.forConstructorAsObject());
  }

  Iterable<String> arguments() {
    return _parameters((p) => p.asArgument());
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
    return '$type $name';
  }

  String forConstructorAsObject() {
    return 'Object? $name';
  }

  String asArgument() {
    return '$name: $name';
  }

  String asArgumentWithDefault() {
    final named = positionType.isNamed ? '$name: ' : '';
    return '$named$name == kCopyWithDefault ? this.$name : $name as $type';
  }
}

/// {@template copy_with_method}
/// Generates a copyWith method for a class.
/// {@endtemplate}
class CopyWithTemplate extends Template {
  /// {@macro copy_with_method}
  const CopyWithTemplate.forSubject(Class subject) : super(subject);

  void _objectCopyWith(StringBuffer buffer) {
    final entry = subject.entryPoint();
    final genClassName = subject.generatedName(throwOnNameFormat: false);
    final entryPointName = entry.isDefault ? '' : '.${entry.name}';
    final returnValue = 'return $genClassName$entryPointName';

    _copyWithMethod(
      buffer,
      signature: subject.privateCopyWithSignature,
      parameters: entry.objectParameters,
      arguments: entry.argumentsWithDefault,
      returnValue: returnValue,
    );
  }

  void _copyWith(StringBuffer buffer) {
    final entry = subject.entryPoint();

    _copyWithMethod(
      buffer,
      signature: subject.copyWithSignature,
      parameters: entry.parameters,
      arguments: entry.arguments,
      returnValue: subject.returnObjectCopyWoth,
      includeObjectCopyWith: true,
    );
  }

  void _copyWithMethod(
    StringBuffer buffer, {
    required String signature,
    required Iterable<String> Function() parameters,
    required Iterable<String> Function() arguments,
    required String returnValue,
    bool includeObjectCopyWith = false,
  }) {
    buffer
      ..writeObject(
        signature,
        open: '({',
        appendNewLine: false,
        body: () {
          buffer.writeAll(parameters());
        },
        close: '})',
      )
      ..writeObject(
        '',
        body: () {
          if (includeObjectCopyWith) {
            _objectCopyWith(buffer);
            buffer.writeln();
          }

          buffer.writeObject(
            returnValue,
            open: '(',
            body: () {
              buffer.writeAll(arguments());
            },
            close: ');',
          );
        },
      );
  }

  @override
  String toString() {
    final buffer = StringBuffer();

    _copyWith(buffer);

    return buffer.toString();
  }

  @override
  void addToBuffer(StringBuffer buffer, {bool wrapWithExtension = false}) {
    if (wrapWithExtension) {
      buffer.writeObject(
        subject.extension,
        body: () {
          _copyWith(buffer);
        },
      );

      return;
    }

    _copyWith(buffer);
  }
}
