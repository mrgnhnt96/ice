import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/copy_with_type_ext.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_function_template.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_simple_template.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice_annotation/ice.dart';

extension on Class {
  CopyWithType get copyWithType {
    final method = annotations.methods;

    if (method != null) {
      return method.copyWithType;
    }

    final ice = annotations.ice;

    if (ice != null) {
      return ice.copyWithType;
    }

    return CopyWithType.simple;
  }
}

extension on CopyWithType {
  String get docComment {
    final desc = description;

    if (desc == null) {
      return '';
    }
    final lines = desc.split('\n');

    return lines.map((e) => '/// $e').join('\n');
  }
}

/// {@template copy_with}
/// the template for a copyWith method
/// {@endtemplate}
abstract class CopyWithTemplate extends Template {
  /// {@macro copy_with}
  CopyWithTemplate(
    Class subject, {
    required this.asExtension,
    required IceOptions name,
    required this.type,
  })  : _constructor = subject.copyWithConstructor(),
        super(subject, name: name);

  /// {@macro copy_with}
  factory CopyWithTemplate.forSubject(
    Class subject, {
    required bool asExtension,
  }) {
    switch (subject.copyWithType) {
      case CopyWithType.simple:
        return CopyWithSimpleTemplate.forSubject(
          subject,
          asExtension: asExtension,
        );
      case CopyWithType.typeSafe:
        return CopyWithFunctionTemplate.forSubject(
          subject,
          asExtension: asExtension,
        );
    }
  }

  /// the type of the copyWith method
  final CopyWithType type;

  /// whether the method is an extension to the class
  final bool asExtension;

  /// the doc comment of the copyWith method
  String get docComment => type.docComment;

  /// the constructor of the class to be used for the copyWith method
  Constructor get constructor {
    if (_constructor == null) {
      throw 'no constructor found';
    }

    return _constructor!;
  }

  final Constructor? _constructor;
}
