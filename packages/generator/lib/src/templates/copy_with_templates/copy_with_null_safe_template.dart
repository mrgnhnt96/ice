// ignore_for_file: dead_code

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/position_type.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';
import 'package:ice_annotation/ice.dart';

/// {@template copy_with_method}
/// Generates a copyWith method for a class.
/// {@endtemplate}
class CopyWithNullSafeTemplate extends CopyWithTemplate {
  /// {@macro copy_with_method}
  CopyWithNullSafeTemplate.forSubject(
    Class subject,
  ) : super(
          subject,
          type: CopyWith.anonymous,
        );

  String get _copyWith => '${subject.genName}CopyWith';
  String get _sentinel => 'sentinelValue';

  @override
  String argReturnValue(Param arg) {
    final returnVal = '${arg.name} == $_sentinel ? _value.${arg.name} : '
        '${arg.name} as ${arg.type}';

    return arg.positionType.map(
      positioned: returnVal,
      named: '${arg.name}: $returnVal',
    );
  }

  @override
  String constructorParam(Param param) => '${param.type} ${param.name}';

  /// the param with a default sentinel value
  String sentinelParam(Param param) => 'Object? ${param.name} = $_sentinel';

  @override
  Iterable<String> get support {
    return <String>{}
      ..add('const $_sentinel = Object();')
      ..add(interface())
      ..add(impl());
  }

  @override
  void copyWithMethod(StringBuffer buffer) {
    buffer.write(
      '$_copyWith get copyWith => '
      '$_copyWith(this);',
    );
  }

  ///
  String interface() {
    final buffer = StringBuffer();

    buffer.writeObject(
      'abstract class $_copyWith',
      body: () {
        buffer
          ..write(
            'const factory $_copyWith(${subject.genName} value) '
            '= ${_copyWith}Impl;',
          )
          ..writeObject(
            '${subject.name} call',
            open: '({',
            close: '});',
            body: () {
              final params = constructor.params.map(constructorParam);
              buffer.writeAll(params, ',');
            },
          );
      },
    );

    return buffer.toString();
  }

  ///
  String impl() {
    final buffer = StringBuffer();

    buffer.writeObject(
      'class ${_copyWith}Impl implements $_copyWith',
      body: () {
        buffer
          ..write('const ${_copyWith}Impl(this._value);')
          ..write('final ${subject.genName} _value;')
          ..writeMethod(
            '${subject.name} call',
            params: constructor.params.map(sentinelParam),
            body: () {
              buffer.writeObject(
                'return ${subject.name}',
                open: '(',
                close: ');',
                body: () {
                  final args = constructor.params.map(argReturnValue);
                  buffer.writeAll(args, ',');
                },
              );
            },
          );
      },
    );

    return buffer.toString();
  }
}
