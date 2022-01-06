// ignore_for_file: dead_code

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/position_type.dart';
import 'package:ice/src/domain/generic_param.dart';
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
          copyWithType: CopyWith.anonymous,
        );

  String get _copyWith => '${subject.genName}CopyWith';
  String get _sentinel => r'_$sentinelValue';
  String get _copyFromType {
    final generics = subject.generics.args;
    if (subject.annotations.isMethodAnnotation) {
      return subject.name + generics;
    }
    return subject.genName + generics;
  }

  @override
  String argReturnValue(Param arg) {
    final asType = 'as ${arg.type}';
    final returnVal = '${arg.name} == $_sentinel ? _value.${arg.name} $asType '
        ': ${arg.name} $asType';

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
      '$_copyWith${subject.generics.args}(this);',
    );
  }

  ///
  String interface() {
    final buffer = StringBuffer();

    buffer.writeObject(
      'abstract class $_copyWith${subject.generics.declaration}',
      body: () {
        buffer
          ..write(
            'const factory $_copyWith($_copyFromType value) '
            '= ${_copyWith}Impl${subject.generics.args};',
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
      'class ${_copyWith}Impl${subject.generics.declaration} '
      'implements $_copyWith${subject.generics.args}',
      body: () {
        buffer
          ..write('const ${_copyWith}Impl(this._value);')
          ..write('final $_copyFromType _value;')
          ..writeMethod(
            '${subject.name} call',
            params: constructor.params.map(sentinelParam),
            body: () {
              var constructorAccess = '';
              if (constructor.name.isNotEmpty &&
                  !subject.annotations.isContainedUnion) {
                constructorAccess = '.${constructor.name}';
              }
              buffer.writeObject(
                'return '
                '${subject.name}${subject.generics.args}$constructorAccess',
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
