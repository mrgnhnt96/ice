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
class CopyWithAnonymousTemplate extends CopyWithTemplate {
  /// {@macro copy_with_method}
  CopyWithAnonymousTemplate.forSubject(
    Class subject,
  ) : super(
          subject,
          copyWithType: CopyWith.anonymous,
        );

  /// the callback name for the copyWith method
  String get callback => r'_$CopyCallback';

  @override
  Iterable<String> get support {
    return {'typedef $callback<T> = T Function(T);'};
  }

  @override
  String argReturnValue(Param arg) => arg.argReturnValue;

  @override
  String constructorParam(Param param) => '$callback${param.constructorParam}';
}
