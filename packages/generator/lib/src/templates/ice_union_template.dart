// ignore_for_file: unused_field, public_member_api_docs

import 'package:change_case/change_case.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/ice.dart';
import 'package:ice/src/templates/templates.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on Class {
  String get nameAsArg => generatedName(retainPrivate: false).toCamelCase();

  String resultArg({bool isRequired = false}) {
    final nullableStr = isRequired ? '' : '?';
    final keyword = isRequired ? 'required ' : '';
    return '${keyword}_Result<R, ${generatedName()}>$nullableStr $nameAsArg';
  }

  String whenParams({bool isRequired = false}) {
    final params = fields.map((e) => '${e.type} ${e.name}');

    var paramsStr = '()';

    if (params.isNotEmpty) {
      paramsStr = '(${params.join(', ')})';
    }

    final nullableStr = isRequired ? '' : '?';
    final keyword = isRequired ? 'required ' : '';

    return '${keyword}R Function$paramsStr$nullableStr $nameAsArg';
  }

  String get whenArgs {
    final params = fields.map((e) => 'state.${e.name}');

    if (params.isEmpty) {
      return '';
    }

    return params.join(', ');
  }

  String get switchCase {
    final genName = generatedName();
    return 'case $genName:\n' 'return $nameAsArg(this as $genName);';
  }

  String toIsType() {
    final genName = generatedName();
    final cleanName = generatedName(retainPrivate: false);

    return 'bool get is$cleanName => this is $genName;';
  }

  String get unionName => name;
}

extension on StringBuffer {
  void returnMap(
    Iterable<Class> classes,
    String Function(Class) f, [
    String prepend = '',
  ]) {
    writeObject(
      'return ${prepend}map',
      open: '(',
      close: ');',
      includeSpaceBetweenOpen: false,
      body: () {
        writeAll(classes.map<String>((e) => f(e)), ',\n');
      },
    );
  }
}

/// A template to generate methods for
/// - copyWith()
/// - Equatable Props
/// - toString()
class IceUnionBaseTemplate extends Template {
  IceUnionBaseTemplate.forSubject(Class subject) : super(subject);

  List<Class> get subtypes =>
      _subtypes ??= IceGenerator.subjects.getUnions(subject);
  List<Class>? _subtypes;

  String methodEntry(String methodName, {bool isNullable = false}) {
    final nullableStr = isNullable ? '?' : '';
    return 'R$nullableStr $methodName<R extends Object?>';
  }

  void _writePatternMatch(
    String name,
    StringBuffer buffer, {
    required Iterable<String> nullableParams,
    required Iterable<String> requiredParams,
    String Function(Class)? base,
    required String Function(Class) maybe,
    required String Function(Class) orNull,
    bool mapWithSwitch = false,
  }) {
    if (!mapWithSwitch) {
      assert(base != null, 'base is required when mapWithSwitch is false');
    }

    final camelName = name.toCamelCase();
    final pascalName = name.toPascalCase();

    buffer
      ..writeMethod(
        methodEntry(camelName),
        params: requiredParams,
        body: () {
          if (mapWithSwitch) {
            buffer.writeObject(
              'switch (this.runtimeType)',
              body: () {
                buffer
                  ..writeAll(subtypes.map<String>((e) => e.switchCase))
                  ..writeln('default:')
                  ..writeln(
                    r"throw UnsupportedError('Unsupported type: $this');",
                  );
              },
            );
          } else {
            buffer.returnMap(subtypes, base!);
          }
        },
      )
      ..writeMethod(
        methodEntry('maybe$pascalName'),
        params: {
          ...nullableParams,
          'required _NoResult<R> orElse',
        },
        body: () {
          buffer.returnMap(subtypes, maybe);
        },
      )
      ..writeMethod(
        methodEntry('${camelName}OrNull', isNullable: true),
        params: nullableParams,
        body: () {
          buffer.returnMap(subtypes, orNull);
        },
      );
  }

  void _writeProperties(StringBuffer buffer) {
    final requiredParams =
        subtypes.map<String>((e) => e.resultArg(isRequired: true));
    final nullableParams = subtypes.map<String>((e) => e.resultArg());

    _writePatternMatch(
      'map',
      buffer,
      requiredParams: requiredParams,
      nullableParams: nullableParams,
      maybe: (subject) {
        final varName = subject.nameAsArg;
        return '$varName: (state) => '
            '$varName?.call(state) ?? orElse()';
      },
      orNull: (subject) {
        final varName = subject.nameAsArg;
        return '$varName: (state) => '
            '$varName?.call(state)';
      },
      mapWithSwitch: true,
    );

    final requiredWhenParams =
        subtypes.map<String>((e) => e.whenParams(isRequired: true));
    final nullableWhenParams = subtypes.map<String>((e) => e.whenParams());

    _writePatternMatch(
      'when',
      buffer,
      requiredParams: requiredWhenParams,
      nullableParams: nullableWhenParams,
      base: (subject) {
        final varName = subject.nameAsArg;
        return '$varName: (state) => $varName(${subject.whenArgs})';
      },
      maybe: (subject) {
        final varName = subject.nameAsArg;
        return '$varName: (state) => '
            '$varName?.call(${subject.whenArgs}) ?? orElse()';
      },
      orNull: (subject) {
        final varName = subject.nameAsArg;
        return '$varName: (state) => $varName?.call(${subject.whenArgs})';
      },
    );

    buffer.writeAll(subtypes.map<String>((e) => e.toIsType()), '\n');
  }

  void _writeSerialize(StringBuffer buffer) {
    buffer.writeObject(
      '_\$${subject.generatedName(retainPrivate: false)}UnionFromJson('
      'Map<String, dynamic> json, [${subject.unionName}? orElse])',
      body: () {
        buffer.writeObject(
          "switch (json['runtimeType'] as String?)",
          body: () {
            buffer
              ..writeAll(
                subtypes.map<String>((e) {
                  final name = e.generatedName();
                  return "case '$name':\n" 'return $name.fromJson(json);';
                }),
                '\n',
              )
              ..writeln('default:\n' 'if (orElse != null) return orElse;')
              ..writeln()
              ..writeln(
                r"throw UnsupportedError('Unsupported type: $json');",
              );
          },
        );
      },
    );

    // ignore: cascade_invocations
    buffer
      ..writeln()
      ..writeObject(
        'Map<String, dynamic> _\$${subject.generatedName(retainPrivate: false)}'
        'UnionToJson(${subject.unionName} instance, '
        '{bool includeRuntimeType = true})',
        body: () {
          buffer
            ..writeln('final runtimeTypeMap = <String, dynamic>{};')
            ..writeObject(
              'if (includeRuntimeType)',
              body: () {
                buffer.writeln(
                  r"runtimeTypeMap['runtimeType'] = '${instance.runtimeType}';",
                );
              },
            )
            ..writeln()
            ..returnMap(
              subtypes,
              (c) {
                final varName = c.nameAsArg;

                return '$varName: ($varName) => '
                    '$varName.toJson()..addAll(runtimeTypeMap)';
              },
              'instance.',
            );
        },
      );
  }

  void _writeClass(StringBuffer buffer) {
    buffer
      ..writeln()
      ..writeObject(
        'mixin _\$${subject.generatedName()}Union',
        body: () {
          _writeProperties(buffer);
        },
      );

    _writeSerialize(buffer);
  }

  @override
  void addToBuffer(StringBuffer buffer, {bool wrapInClass = true}) {
    if (subtypes.isEmpty) return;

    buffer
      ..writeln(
        'typedef _Result<R, T extends ${subject.unionName}> = R Function(T);',
      )
      ..writeln('typedef _NoResult<R> = R Function();');

    if (wrapInClass) {
      _writeClass(buffer);
    } else {
      _writeProperties(buffer);
      _writeSerialize(buffer);
    }
  }

  @override
  String toString() {
    final buffer = StringBuffer();

    addToBuffer(buffer);

    return buffer.toString();
  }
}
