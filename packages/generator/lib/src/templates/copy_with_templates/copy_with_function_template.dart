// ignore_for_file: dead_code

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_extensions.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';
import 'package:ice_annotation/ice.dart';

extension on Param {
  String forConstructor() {
    return 'CopyCallback<$type>? $name';
  }

  String asArgument() {
    return '$name: $name == null ? this.$name : $name(this.$name)';
  }
}

/// {@template copy_with_method}
/// Generates a copyWith method for a class.
/// {@endtemplate}
class CopyWithFunctionTemplate extends CopyWithTemplate {
  /// {@macro copy_with_method}
  CopyWithFunctionTemplate.forSubject(
    Class subject,
  ) : super(
          subject,
          type: CopyWithType.typeSafe,
        );

  @override
  void support(StringBuffer buffer) {
    buffer.writeln('typedef CopyCallback<T> = T Function(T);');
  }

  @override
  void generate(StringBuffer buffer) {
    buffer.writeMethod(
      subject.copyWithHeader,
      params: constructor.parameters((p) => p.forConstructor()),
      body: () {
        buffer.writeObject(
          'return ${constructor.displayName}',
          open: '(',
          includeSpaceBetweenOpen: false,
          body: () => buffer.writeAll(
            constructor.arguments((p) => p.asArgument()),
            ',\n',
          ),
          close: ');',
        );
      },
    );
  }
}
