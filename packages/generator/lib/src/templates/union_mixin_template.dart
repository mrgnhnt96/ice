// ignore_for_file: unused_field, public_member_api_docs

import 'package:change_case/change_case.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/position_type.dart';
import 'package:ice/src/templates/templates.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on Class {
  String get unionBase => '\$$cleanName';
  String get union => '_\$$cleanName';
  String get unionMixin => '_\$${cleanName}Mixin';

  String get classHeader {
    final hasEquatable = metaSettings(
      methodCallback: (_) => false,
      iceCallback: (settings) => settings.equatable,
      settingsCallback: (settings) => settings.equatable,
    );
    var equatable = '';

    if (hasEquatable) {
      equatable = ', EquatableMixin';
    }
    return 'abstract $union with $unionMixin$equatable implements $unionBase';
  }

  String get nameAsArg => nonPrivateName.toCamelCase();

  String mapParams({bool isRequired = false}) {
    final nullableStr = isRequired ? '' : '?';
    final keyword = isRequired ? 'required ' : '';
    return '${keyword}_Result<R, $genName>$nullableStr $nameAsArg';
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
    return 'case $genName:\n' 'return $nameAsArg(this as $genName);';
  }

  String toIsType() {
    return 'bool get is$cleanName => this is $genName;';
  }

  String get unionName => name;
}

extension on Constructor {
  String get args {
    final args = <String>[];

    for (final param in params) {
      final name = param.name;

      if (param.positionType.isNamed) {
        args.add('$name: $name');
        continue;
      }

      args.add(name);
    }

    return args.join(',\n');
  }
}

extension on StringBuffer {
  void writeMap(
    Iterable<Class> classes,
    String Function(Class) returnStr,
  ) {
    writeObject(
      'return map',
      open: '(',
      close: ');',
      body: () {
        writeAll(classes.map<String>(returnStr), ',\n');
      },
    );
  }
}

/// A template to generate methods for
/// - copyWith()
/// - Equatable Props
/// - toString()
class UnionMixinTemplate extends Template {
  UnionMixinTemplate.forSubject(
    Class subject,
    this.subClasses,
  ) : super.wrapper(subject);
  final List<Class> subClasses;

  String get result => '_Result';

  @override
  void generate(StringBuffer buffer) {
    _writeSupport(buffer);
    _writeUnionBase(buffer);

    buffer.writeObject(
      'mixin _\$${subject.name}Mixin',
      body: () {
        _writePatternMatches(buffer);
        _writeIsType(buffer);
      },
    );
  }

  void _writeIsType(StringBuffer buffer) {
    buffer.writeAll(subClasses.map<String>((e) => e.toIsType()), '\n');
  }

  void _writeSupport(StringBuffer buffer) {
    buffer
      ..writeln(
        'typedef _Result<R, T extends ${subject.unionName}> = R Function(T);',
      )
      ..writeln('typedef _NoResult<R> = R Function();');
  }

  void _writeUnionBase(StringBuffer buffer) {
    buffer.writeObject(
      'abstract class ${subject.unionBase}',
      body: () {
        buffer
          ..writeln('const ${subject.unionBase}();')
          ..writeln()
          ..writeln('String get \$${subject.cleanName}Type;');
      },
    );
  }

  void _writePatternMatches(StringBuffer buffer) {
    void writeSwitch() {
      buffer.writeObject(
        'switch (this.runtimeType)',
        body: () {
          buffer
            ..writeAll(subClasses.map<String>((e) => e.switchCase))
            ..writeln('default:')
            ..writeln(
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
          isRequired: type.map(
            base: true,
            maybe: false,
            orNull: false,
          ),
        );
        params.add(param);

        if (!toWriteSwitch) {
          final arg = type.arg(pattern, item, subject.cleanName);
          args.add(arg);
        }
      }

      final additionalParam = type.additionalParam;
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
              buffer.writeAll(args, ',\n');
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
    required bool isRequired,
  }) {
    return map(
      map: sub.mapParams(isRequired: isRequired),
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
      return 'R$nullableStr $methodName<R extends Object?>';
    }

    return methodEntry(getName(), isNullable: isNullable);
  }

  String arg(Pattern pattern, Class sub, String unionName) {
    final name = sub.nameAsArg;
    final args = sub.whenArgs;
    final union = unionName.toCamelCase();

    final getArg = map(
      base: pattern.map(
        map: () {
          throw Exception('The map must be created');
        },
        when: () {
          return '$name: ($union) => $name($args)';
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

  String? get additionalParam {
    return mapOrNull(
      maybe: 'required _NoResult<R> orElse',
    );
  }
}
