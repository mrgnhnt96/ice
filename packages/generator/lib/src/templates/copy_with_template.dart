import 'package:ice/src/domain/domain.dart';
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
  Iterable<String> parameters(int tabAmount) {
    return _parameters(tabAmount, (p) => p.forConstructor());
  }

  Iterable<String> objectParameters(int tabAmount) {
    return _parameters(tabAmount, (p) => p.forConstructorAsObject());
  }

  Iterable<String> arguments(int tabAmount) {
    return _parameters(tabAmount, (p) => p.asArgument());
  }

  Iterable<String> argumentsWithDefault(int tabAmount) {
    return _parameters(tabAmount, (p) => p.asArgumentWithDefault());
  }

  Iterable<String> _parameters(int tabAmount, String Function(Param) toString) {
    return params.map((p) {
      final param = '${toString(p)},\n';

      return tab(param, tabAmount);
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
class CopyWithTemplate {
  /// {@macro copy_with_method}
  const CopyWithTemplate.forSubject(Class subject) : _subject = subject;

  final Class _subject;

  void _privateCopyWith(StringBuffer buffer) {
    final entry = _subject.entryPoint();

    _copyWithMethod(
      buffer,
      signature: _subject.privateCopyWithSignature,
      parameters: entry.objectParameters,
      arguments: entry.argumentsWithDefault,
      returnValue: entry.returnValue,
    );
  }

  void _publicCopyWith(StringBuffer buffer) {
    final entry = _subject.entryPoint();

    _copyWithMethod(
      buffer,
      signature: _subject.copyWithSignature,
      parameters: entry.parameters,
      arguments: entry.arguments,
      returnValue: _subject.returnPrivateCopyWith,
    );
  }

  void _copyWithMethod(
    StringBuffer buffer, {
    required String signature,
    required Iterable<String> Function(int) parameters,
    required Iterable<String> Function(int) arguments,
    required String returnValue,
  }) {
    buffer
      ..writeObject(
        signature,
        open: '({',
        appendNewLine: false,
        body: (sig, sigTab) {
          sig.writeAll(parameters(sigTab));
        },
        close: '})',
      )
      ..writeObject(
        '',
        body: (body, bodyTab) {
          body.writeObject(
            returnValue,
            tab: bodyTab,
            open: '(',
            body: (ret, retTab) {
              ret.writeAll(arguments(retTab));
            },
            close: ');',
          );
        },
      );
  }

  @override
  String toString() {
    final buffer = StringBuffer();

    _publicCopyWith(buffer);

    buffer.writeln();

    _privateCopyWith(buffer);

    return buffer.toString();
  }
}
