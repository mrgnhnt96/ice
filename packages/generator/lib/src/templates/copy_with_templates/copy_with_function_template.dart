// ignore_for_file: dead_code

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_extensions.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';
import 'package:ice_annotation/ice.dart';

extension on Param {
  String forConstructor() {
    return '$nullableType $name';
  }

  String asArgument() {
    return '$name: $name ?? this.$name';
  }
}

/// {@template copy_with_method}
/// Generates a copyWith method for a class.
/// {@endtemplate}
class CopyWithFunctionTemplate extends CopyWithTemplate {
  /// {@macro copy_with_method}
  CopyWithFunctionTemplate.forSubject(
    Class subject, {
    bool asExtension = false,
  }) : super(
          subject,
          asExtension: asExtension,
          name: IceOptions.copyWithFunction,
          type: CopyWithType.typeSafe,
        );

  @override
  void generate(StringBuffer buffer) {
    if (asExtension) {
      buffer.writeObject(
        '',
        body: () => _copyWithMethod(buffer),
      );

      return;
    }

    _copyWithMethod(buffer);
  }

  void _copyWithMethod(StringBuffer buffer) {
    final returnVal = 'return ${subject.genName}${constructor.name}';

    buffer.writeMethod(
      subject.copyWithHeader,
      params: constructor.parameters((p) => p.forConstructor()),
      body: () {
        buffer.writeObject(
          returnVal,
          open: '(',
          body: () =>
              buffer.writeAll(constructor.arguments((p) => p.asArgument())),
          close: ');',
        );
      },
    );
  }
}
