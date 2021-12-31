import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/copy_with_type_ext.dart';
import 'package:ice/src/domain/enums/position_type.dart';
import 'package:ice/src/domain/ice_support.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_function_template.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_simple_template.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';
import 'package:ice_annotation/ice.dart';

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
    required this.type,
  })  : _constructor = subject.copyWithConstructor(),
        super(subject, name: IceOptions.copyWith);

  /// {@macro copy_with}
  static CopyWithTemplate? forSubject(Class subject) {
    final type = subject.copyWith;
    switch (type) {
      case CopyWith.typeSafe:
        return CopyWithFunctionTemplate.forSubject(
          subject,
        );
      case CopyWith.simple:
        return CopyWithSimpleTemplate.forSubject(
          subject,
        );
      case CopyWith.none:
        return null;
    }
  }

  /// the type of the copyWith method
  final CopyWith type;
  final Constructor? _constructor;

  /// the constructor of the class to be used for the copyWith method
  Constructor get constructor {
    if (_constructor == null) {
      throw 'no constructor found';
    }

    return _constructor!;
  }

  /// the doc comment of the copyWith method
  String get docComment => type.docComment;

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

  @override
  void generate(StringBuffer buffer) {
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

  /// any preparation/support that is needed for the copyWith method
  /// to succeffully generate
  String get support => '';

  /// adds support to [IceSupport]
  void addSupport() {
    if (!canBeGenerated) {
      return;
    }

    IceSupport().add(support);
  }
}
