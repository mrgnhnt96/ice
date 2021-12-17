import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/position_type.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on Class {
  String get extension {
    return 'extension ${name}X on $name';
  }

  String get copyWithSignature {
    return '$genName copyWith';
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
  CopyWithTemplate.forSubject(Class subject)
      : super(
          subject,
          name: IceOptions.copyWithSimple,
        );

  @override
  void generate(StringBuffer buffer) {
    _copyWithMethod(buffer);
  }

  void _copyWithMethod(StringBuffer buffer) {
    final genName = subject.genName;
    final entry = subject.copyWithConstructor();
    if (entry == null) return;

    final classReturnValue = 'return $genName${entry.name}';

    final args = entry.arguments();
    final params = entry.parameters();
    final sig = subject.copyWithSignature;
    final returnVal = params.isEmpty ? classReturnValue : 'return _copyWith';

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
}
