import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/copy_with_type_ext.dart';
import 'package:ice/src/domain/enums/position_type.dart';
import 'package:ice/src/domain/ice_support.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_anonymous_template.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_null_safe_template.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_simple_template.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';
import 'package:ice_annotation/ice.dart';
import 'package:meta/meta.dart';

// TODO(mrgnhnt96): add a "_then" annonymous function that will handle
// deep copies (freezed)
//
// I need the declaration from the CopyWith method in order to provide the
// same copyWith method as a deep copy

extension on Class {
  CopyWith get copyWith {
    return metaSettings(
      methodCallback: (method) => method.copyWithType,
      iceCallback: (ice) => ice.copyWith,
      settingsCallback: (settings) => settings.copyWith,
    );
  }

  /// the constructor to be used to to generate the copyWith method
  Constructor? copyWithConstructor() {
    return constructorWhere((ctor) => ctor.isCopyWithConstructor);
  }
}

extension on Constructor {
  /// the params
  Iterable<String> parameters(String Function(Param) callback) {
    return params.map((p) => callback(p));
  }

  /// the args
  Iterable<String> arguments(String Function(Param) callback) {
    return params.map((p) => callback(p));
  }
}

extension on CopyWith {
  String get docComment {
    final desc = description;

    if (desc == null) {
      return '';
    }
    final lines = desc.split('\n');

    String descript(String str) {
      const comment = '///';
      if (str.isEmpty) {
        return comment;
      }
      return '$comment $str';
    }

    return lines.map(descript).join('\n');
  }
}

/// {@template copy_with}
/// the template for a copyWith method
/// {@endtemplate}
abstract class CopyWithTemplate extends Template {
  /// {@macro copy_with}
  CopyWithTemplate(
    Class subject, {
    required this.copyWithType,
  })  : _constructor = subject.copyWithConstructor(),
        super(subject, templateType: TemplateType.copyWith);

  /// {@macro copy_with}
  static CopyWithTemplate? forSubject(Class subject) {
    final type = subject.copyWith;
    switch (type) {
      case CopyWith.anonymous:
        return CopyWithAnonymousTemplate.forSubject(subject);
      case CopyWith.nullSafe:
        return CopyWithNullSafeTemplate.forSubject(subject);
      case CopyWith.simple:
        return CopyWithSimpleTemplate.forSubject(subject);
      case CopyWith.none:
        return null;
    }
  }

  /// the type of the copyWith method
  final CopyWith copyWithType;
  final Constructor? _constructor;

  /// the constructor of the class to be used for the copyWith method
  Constructor get constructor {
    if (_constructor == null) {
      throw 'no constructor found';
    }

    return _constructor!;
  }

  /// the doc comment of the copyWith method
  String get docComment => copyWithType.docComment;

  @override
  bool get canBeGenerated {
    if (subject.annotations.isUnionBase) {
      return false;
    }

    return super.canBeGenerated;
  }

  ///
  String get header => '${subject.name} copyWith';

  ///
  String constructorParam(Param param);

  ///
  String argReturnValue(Param arg);

  /// the copy with method to be generated
  void copyWithMethod(StringBuffer buffer) {
    buffer
      ..writeln(docComment)
      ..writeMethod(
        header,
        params: constructor.parameters(constructorParam),
        body: () {
          buffer.writeObject(
            'return ${constructor.displayName}',
            open: '(',
            body: () => buffer.writeAll(
              constructor.arguments((p) {
                if (p.positionType.isPositional) {
                  return argReturnValue(p);
                }

                return '${p.name}: ${argReturnValue(p)}';
              }),
              ',',
            ),
            close: ');',
          );
        },
      );
  }

  /// not intended to be overridden
  @override
  void generate(StringBuffer buffer) {
    if (constructor.params.isEmpty) {
      buffer
          .write('${subject.name} copyWith() => ${constructor.displayName}();');
      return;
    }
    copyWithMethod(buffer);
  }

  /// any preparation/support that is needed for the copyWith method
  /// to succeffully generate
  Iterable<String> get support => {};

  /// adds copywith's support to [IceSupport]
  void _addSupport() {
    if (!canBeGenerated) {
      return;
    }

    if (constructor.params.isEmpty) {
      return;
    }

    IceSupport().addAll(support);
  }

  @mustCallSuper
  @override
  void addToBuffer(StringBuffer buffer) {
    _addSupport();
    super.addToBuffer(buffer);
  }
}
