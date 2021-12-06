import 'package:ice/src/domain/domain.dart';
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

  String get returnPrivateCopyWith {
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

  String get returnValue {
    return 'return $displayName';
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
    return '$name: $name == kCopyWithDefault ? this.$name : $name as $type';
  }
}

/// {@template copy_with_method}
/// Generates a copyWith method for a class.
/// {@endtemplate}
class CopyWithTemplate extends Template {
  /// {@macro copy_with_method}
  const CopyWithTemplate.forSubject(Class subject) : super(subject);

  void _privateCopyWith(StringBuffer buffer) {
    final entry = subject.entryPoint();

    _copyWithMethod(
      buffer,
      signature: subject.privateCopyWithSignature,
      parameters: entry.objectParameters,
      arguments: entry.argumentsWithDefault,
      returnValue: entry.returnValue,
    );
  }

  void _publicCopyWith(StringBuffer buffer) {
    final entry = subject.entryPoint();

    _copyWithMethod(
      buffer,
      signature: subject.copyWithSignature,
      parameters: entry.parameters,
      arguments: entry.arguments,
      returnValue: subject.returnPrivateCopyWith,
    );
  }

  void _copyWithMethod(
    StringBuffer buffer, {
    required String signature,
    required Iterable<String> Function() parameters,
    required Iterable<String> Function() arguments,
    required String returnValue,
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

  void _writeCopyWith(StringBuffer buffer) {
    _privateCopyWith(buffer);

    buffer.writeln();

    _publicCopyWith(buffer);
  }

  @override
  String toString() {
    final buffer = StringBuffer();

    _writeCopyWith(buffer);

    return buffer.toString();
  }

  @override
  void addToBuffer(StringBuffer buffer, {bool wrapWithExtension = false}) {
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
