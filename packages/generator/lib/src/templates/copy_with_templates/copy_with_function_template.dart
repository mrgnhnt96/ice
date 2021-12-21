// ignore_for_file: dead_code

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_template.dart';
import 'package:ice_annotation/ice.dart';

extension on Param {
  String get constructorParam {
    return '<$type>? $name';
  }

  String get argReturnValue {
    return '$name == null ? this.$name : $name(this.$name)';
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

  /// the callback name for the copyWith method
  String get callback => r'_$CopyCallback';

  @override
  void support(StringBuffer buffer) {
    buffer.writeln('typedef $callback<T> = T Function(T);');
  }

  @override
  String argReturnValue(Param arg) => arg.argReturnValue;

  @override
  String constructorParam(Param param) => '$callback${param.constructorParam}';
}
