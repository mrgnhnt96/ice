import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_template.dart';
import 'package:ice_annotation/ice.dart';

extension on Param {
  String get constructorParam {
    return '$nullableType $name';
  }

  String get argReturnValue {
    return '$name ?? this.$name';
  }
}

/// {@template copy_with_method}
/// Generates a copyWith method for a class.
/// {@endtemplate}
class CopyWithSimpleTemplate extends CopyWithTemplate {
  /// {@macro copy_with_method}
  CopyWithSimpleTemplate.forSubject(Class subject)
      : super(
          subject,
          type: CopyWith.simple,
        );

  @override
  String argReturnValue(Param arg) => arg.argReturnValue;

  @override
  String constructorParam(Param param) => param.constructorParam;
}
