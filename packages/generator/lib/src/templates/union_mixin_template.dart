// ignore_for_file: unused_field, public_member_api_docs

import 'package:change_case/change_case.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/generic_param.dart';
import 'package:ice/src/domain/ice_support.dart';
import 'package:ice/src/templates/from_json_template.dart';
import 'package:ice/src/templates/templates.dart';
import 'package:ice/src/templates/to_json_template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

const _returnType = r'_$T';
const _resultType = r'_$R';

extension on Class {
  String mapParams(String result, {bool isRequired = false}) {
    final nullableStr = isRequired ? '' : '?';
    final keyword = isRequired ? 'required ' : '';

    return '$keyword$result<$_resultType, $genName>$nullableStr '
        '$nameAsArg';
  }

  String whenParams({bool isRequired = false}) {
    final params = fields.map((e) => '${e.type} ${e.name}');

    var paramsStr = '()';

    if (params.isNotEmpty) {
      paramsStr = '(${params.join(', ')},)';
    }

    final nullableStr = isRequired ? '' : '?';
    final keyword = isRequired ? 'required ' : '';

    return '$keyword$_resultType Function${generics.declaration}'
        '$paramsStr$nullableStr $nameAsArg';
  }

  String whenArgs(String union) {
    final params = fields.map((e) => '$union.${e.name}');

    if (params.isEmpty) {
      return '';
    }

    return '${params.join(', ')},';
  }

  String get switchCase {
    return 'case $genName:$pln return $nameAsArg(this as $genName);';
  }

  String toIsType() {
    return 'bool get is$cleanName => this is $name;';
  }

  String toAsType() {
    return '$name get as$cleanName => this as $name;';
  }

  String get unionName => name;
}

/// A template to generate methods for
/// - copyWith()
/// - Equatable Props
/// - toString()
class UnionMixinTemplate extends Template {
  UnionMixinTemplate.forSubject(Class subject, this.subClasses)
      : super.wrapper(subject);

  final Iterable<Class> subClasses;

  String get result => '_\$${subject.cleanName}Callback';
  String get noResult => '_\$No${subject.cleanName}Callback';

  @override
  void generate(StringBuffer buffer) {
    _writeSupport();

    buffer.writeObject(
      'mixin _\$${subject.cleanName}Mixin',
      body: () {
        _writePatternMatches(buffer);
        ToJsonTemplate.forUnion(subject, subClasses).addToBuffer(buffer);
        _writeAsType(buffer);
        _writeIsType(buffer);
      },
    );

    FromJsonTemplate.forUnion(subject, subClasses).addToBuffer(buffer);
  }

  void _writeIsType(StringBuffer buffer) {
    buffer.writeAll(subClasses.map<String>((e) => e.toIsType()), pln);
  }

  void _writeAsType(StringBuffer buffer) {
    for (final item in subClasses) {
      buffer.writeObject(
        '${item.name} get as${item.cleanName}',
        body: () {
          buffer
            ..writeObject(
              'if (!is${item.cleanName})',
              body: () {
                buffer.write(
                  "throw Exception('${subject.name} runtimeType is not "
                  "of type ${item.name}');",
                );
              },
            )
            ..write('return this as ${item.name};');
        },
      );
    }
  }

  void _writeSupport() {
    IceSupport().addAll([
      // ignore: lines_longer_than_80_chars
      'typedef $result<$_resultType, $_returnType extends ${subject.unionName}> = $_resultType Function($_returnType);',
      'typedef $noResult<$_resultType> = $_resultType Function();'
    ]);
  }

  void _writePatternMatches(StringBuffer buffer) {
    void writeSwitch() {
      buffer.writeObject(
        'switch (runtimeType)',
        body: () {
          buffer
            ..writeAll(subClasses.map<String>((e) => e.switchCase))
            ..writepln('default:')
            ..writepln(
              r"throw UnsupportedError('Unsupported type: $this');",
            );
        },
      );
    }

    void writePattern({
      required Pattern pattern,
      required PatternType type,
    }) {
      final toWriteSwitch = type.isBase && pattern.isMap;

      final params = <String>[];
      final args = <String>[];

      for (final item in subClasses) {
        final param = pattern.param(
          item,
          result: result,
          isRequired: type.map(
            base: true,
            maybe: false,
            orNull: false,
          ),
        );
        params.add(param);

        if (!toWriteSwitch) {
          final arg = type.arg(pattern, item);
          args.add(arg);
        }
      }

      final additionalParam = type.additionalParam(noResult);
      if (additionalParam != null) {
        params.add(additionalParam);
      }

      buffer.writeMethod(
        type.name(pattern),
        params: params,
        body: () {
          if (toWriteSwitch) {
            writeSwitch();
            return;
          }

          buffer.writeObject(
            'return map',
            open: '(',
            close: ');',
            body: () {
              buffer.writeAll(args, ',$pln');
              if (args.isNotEmpty) {
                buffer.writepln(',');
              }
            },
          );
        },
      );
    }

    for (final type in PatternType.values) {
      for (final pattern in Pattern.values) {
        writePattern(
          pattern: pattern,
          type: type,
        );
      }
    }
  }
}

enum Pattern {
  map,
  when,
}

enum PatternType {
  base,
  maybe,
  orNull,
}

extension on Pattern {
  bool get isMap => this == Pattern.map;

  T map<T extends Object?>({
    required T map,
    required T when,
  }) {
    switch (this) {
      case Pattern.map:
        return map;
      case Pattern.when:
        return when;
    }
  }

  T? mapOrNull<T extends Object?>({
    T? map,
    T? when,
  }) {
    return this.map(
      map: map,
      when: when,
    );
  }

  String param(
    Class sub, {
    required String result,
    required bool isRequired,
  }) {
    return map(
      map: sub.mapParams(result, isRequired: isRequired),
      when: sub.whenParams(isRequired: isRequired),
    );
  }
}

extension on PatternType {
  bool get isBase => this == PatternType.base;
  T map<T extends Object?>({
    required T base,
    required T maybe,
    required T orNull,
  }) {
    switch (this) {
      case PatternType.base:
        return base;
      case PatternType.maybe:
        return maybe;
      case PatternType.orNull:
        return orNull;
    }
  }

  T? mapOrNull<T extends Object?>({
    T? base,
    T? maybe,
    T? orNull,
  }) {
    return map(
      base: base,
      maybe: maybe,
      orNull: orNull,
    );
  }

  String name(Pattern pattern) {
    var isNullable = false;

    final pat = pattern.name;

    final getName = map(
      base: pat.toCamelCase,
      maybe: () => 'maybe${pat.toPascalCase()}',
      orNull: () {
        isNullable = true;
        return '${pat.toCamelCase()}OrNull';
      },
    );

    String methodEntry(String methodName, {bool isNullable = false}) {
      final nullableStr = isNullable ? '?' : '';
      return '$_resultType$nullableStr $methodName<$_resultType '
          'extends Object?>';
    }

    return methodEntry(getName(), isNullable: isNullable);
  }

  String arg(Pattern pattern, Class sub) {
    final name = sub.nameAsArg;
    const union = 'u';
    final args = sub.whenArgs(union);

    final getArg = map(
      base: pattern.map(
        map: () {
          throw Exception('The map must be created');
        },
        when: () {
          return '$name: ($union) => $name.call($args)';
        },
      ),
      maybe: pattern.map(
        map: () {
          return '$name: ($union) => $name?.call($union) ?? orElse()';
        },
        when: () {
          return '$name: ($union) => $name?.call($args) ?? orElse()';
        },
      ),
      orNull: pattern.map(
        map: () {
          return '$name: ($union) => $name?.call($union)';
        },
        when: () {
          return '$name: ($union) => $name?.call($args)';
        },
      ),
    );

    return getArg();
  }

  String? additionalParam(String noResult) {
    return mapOrNull(
      maybe: 'required $noResult<$_resultType> orElse',
    );
  }
}
