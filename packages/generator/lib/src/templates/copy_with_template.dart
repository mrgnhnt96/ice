import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/position_type.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on Class {
  String get extension {
    return 'extension ${name}X on $name';
  }

  String get copyWithSignature {
    final genName = generatedName();
    return '$genName copyWith';
  }

  String get privateCopyWithSignature {
    final genName = generatedName();
    return '$genName _copyWith';
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
    return '$nullableType $name';
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
  CopyWithTemplate.forSubject(Class subject) : super(subject);

  /// the constructor entry for copywith
  Constructor get entry => _entry ??= subject.entryPoint();
  Constructor? _entry;

  void _copyWithMethod(
    StringBuffer buffer, {
    String? signature,
    Iterable<String> Function()? parameters,
    Iterable<String> Function()? arguments,
    String? returnValue,
    bool includeObjectCopyWith = true,
  }) {
    final genClassName = subject.generatedName();
    final entryPointName = entry.isDefault ? '' : '.${entry.name}';
    final classReturnValue = 'return $genClassName$entryPointName';

    final args = arguments?.call() ?? entry.arguments();
    final params = parameters?.call() ?? entry.parameters();
    final sig = signature ?? subject.copyWithSignature;
    final returnVal =
        returnValue ?? (params.isEmpty ? classReturnValue : 'return _copyWith');

    void _objectCopyWith(StringBuffer buffer) {
      _copyWithMethod(
        buffer,
        signature: subject.privateCopyWithSignature,
        parameters: entry.objectParameters,
        arguments: entry.argumentsWithDefault,
        returnValue: classReturnValue,
        includeObjectCopyWith: false,
      );
    }

    final open = params.isNotEmpty ? '({' : '(';
    final close = params.isNotEmpty ? '})' : ')';

    buffer
      ..writeObject(
        sig,
        open: open,
        appendNewLine: false,
        body: () {
          buffer.writeAll(params);
        },
        close: close,
      )
      ..writeObject(
        '',
        body: () {
          if (includeObjectCopyWith && params.isNotEmpty) {
            _objectCopyWith(buffer);
            buffer.writeln();
          }

          buffer.writeObject(
            returnVal,
            open: '(',
            body: () {
              buffer.writeAll(args);
            },
            close: ');',
          );
        },
      );
  }

  @override
  String toString() {
    final buffer = StringBuffer();

    _copyWithMethod(buffer);

    return buffer.toString();
  }

  @override
  void addToBuffer(StringBuffer buffer, {bool wrapWithExtension = false}) {
    if (wrapWithExtension) {
      buffer.writeObject(
        subject.extension,
        body: () {
          _copyWithMethod(buffer);
        },
      );

      return;
    }

    _copyWithMethod(buffer);
  }
}
