import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/copy_with_type_ext.dart';
import 'package:ice/src/domain/enums/position_type.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_function_template.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_simple_template.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';
import 'package:ice_annotation/ice.dart';

extension on Class {
  CopyWithType get copyWithType {
    return metaSettings(
      methodCallback: (method) => method.copyWithType,
      iceCallback: (ice) => ice.copyWithType,
      settingsCallback: (settings) => settings.copyWithType,
    );
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
    required this.type,
  })  : _constructor = subject.copyWithConstructor(),
        super(subject, name: IceOptions.copyWith);

  /// {@macro copy_with}
  factory CopyWithTemplate.forSubject(Class subject) {
    switch (subject.copyWithType) {
      case CopyWithType.simple:
        return CopyWithSimpleTemplate.forSubject(
          subject,
        );
      case CopyWithType.typeSafe:
        return CopyWithFunctionTemplate.forSubject(
          subject,
        );
    }
  }

  /// the type of the copyWith method
  final CopyWithType type;
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
    if (!super.canBeGenerated) {
      return false;
    }

    if (subject.annotations.isUnionBase) {
      return false;
    }

    return true;
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
            includeSpaceBetweenOpen: false,
            body: () => buffer.writeAll(
              constructor.arguments((p) {
                if (p.positionType.isPositional) {
                  return argReturnValue(p);
                }

                return '${p.name}: ${argReturnValue(p)}';
              }),
              ',\n',
            ),
            close: ');',
          );
        },
      );
  }

  /// any preparation/support that is needed for the copyWith method
  /// to succeffully generate
  void writeSupport(StringBuffer buffer) => gate(buffer, support);

  /// any preparation/support that is needed for the copyWith method
  /// to succeffully generate
  void support(StringBuffer buffer);
}
