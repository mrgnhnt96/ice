// ignore_for_file: unused_field, public_member_api_docs

import 'package:change_case/change_case.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/ice.dart';
import 'package:ice/src/templates/templates.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on Class {
  String get nameAsArg => generatedName(retainPrivate: false).toCamelCase();

  String get resultArg {
    return '_Result<R, ${generatedName()}> $nameAsArg';
  }

  String get whenParams {
    final params = fields.map((e) => '${e.type} ${e.name}');

    var paramsStr = '()';

    if (params.isNotEmpty) {
      paramsStr = '(${params.join(', ')})';
    }

    return 'R Function$paramsStr $nameAsArg';
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
}

extension on StringBuffer {
  void returnMap(Iterable<Class> classes, String Function(Class) f) {
    writeObject(
      'return map',
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

  String get className => subject.generatedName();

  String methodEntry(String methodName, {bool isNullable = false}) {
    final nullableStr = isNullable ? '?' : '';
    return 'R$nullableStr $methodName<R extends Object?>';
  }

  void _writePatternMatch(
    String name,
    StringBuffer buffer,
    Iterable<String> params, {
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
        params: params,
        body: () {
          if (mapWithSwitch) {
            buffer.writeObject(
              'switch (this.runtimetype)',
              body: () {
                buffer
                  ..writeAll(subtypes.map<String>((e) => e.switchCase))
                  ..writeln('default:')
                  ..writeln(
                    r"throw UnsupportedError('Unsupported type: $this')",
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
          ...params,
          'required _NoResult<R> orElse',
        },
        body: () {
          buffer.returnMap(subtypes, maybe);
        },
      )
      ..writeMethod(
        methodEntry('${camelName}OrNull', isNullable: true),
        params: params,
        body: () {
          buffer.returnMap(subtypes, orNull);
        },
      );
  }

  void _writeProperties(StringBuffer buffer) {
    final params = subtypes.map<String>((e) => e.resultArg);

    _writePatternMatch(
      'map',
      buffer,
      params,
      maybe: (subject) {
        final varName = subject.nameAsArg;
        return '$varName: (state) => '
            '$varName?.call(state) ?? orElse(state)';
      },
      orNull: (subject) {
        final varName = subject.nameAsArg;
        return '$varName: (state) => '
            '$varName?.call(state)';
      },
      mapWithSwitch: true,
    );

    final whenParams = subtypes.map<String>((e) => e.whenParams);

    _writePatternMatch(
      'when',
      buffer,
      whenParams,
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

    buffer
      ..writeAll(subtypes.map<String>((e) => e.toIsType()))
      ..writeln()
      ..writeObject(
        'factory $className.fromJson(Map<String, dynamic> json, '
        '[$className? orElse]))',
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
        'extension \$${className}Extension on $className',
        body: () {
          buffer.writeObject(
            'Map<String, dynamic> toJson({bool includeRuntimeType = true})',
            body: () {
              buffer
                ..writeObject(
                  'if (includeRuntimeType)',
                  body: () {
                    buffer.writeln(
                      r"runtimeTypeMap['runtimeType'] = '$runtimeType';",
                    );
                  },
                )
                ..writeln()
                ..returnMap(subtypes, (c) {
                  final varName = c.nameAsArg;
                  return '$varName: $varName.toJson()..addAll(runtimeTypeMap)';
                });
            },
          );
        },
      );
  }

  void _writeClass(StringBuffer buffer) {
    buffer
      ..writeln()
      ..writeObject(
        subject.classEntry,
        body: () {
          buffer.writeAll(subject.constructors.declarations(className));
          _writeProperties(buffer);
        },
      );
  }

  @override
  void addToBuffer(StringBuffer buffer, {bool wrapInClass = true}) {
    if (subtypes.isEmpty) return;

    buffer
      ..writeln('typedef _Result<R, T extends $className> = R Function(T);')
      ..writeln('typedef _NoResult<R> = R Function();');

    if (wrapInClass) {
      _writeClass(buffer);
    } else {
      _writeProperties(buffer);
    }
  }

  @override
  String toString() {
    final buffer = StringBuffer();

    addToBuffer(buffer);

    return buffer.toString();
  }
}
