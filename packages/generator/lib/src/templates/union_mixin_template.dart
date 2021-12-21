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

  String resultArg({bool isRequired = false}) {
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

  @override
  void generate(StringBuffer buffer) {
    //   buffer
    //     ..writeln(
    // ignore: lines_longer_than_80_chars
    //       'typedef _Result<R, T extends ${subject.unionName}> = R Function(T);',
    //     )
    //     ..writeln('typedef _NoResult<R> = R Function();');
    buffer
      ..writeObject(
        'abstract class ${subject.unionBase}',
        body: () {
          buffer
            ..writeln('const ${subject.unionBase}();')
            ..writeln()
            ..writeln('String get \$${subject.cleanName}Type;');
        },
      )
      ..writeln('mixin _\$${subject.name}Mixin {}');
  }

  String methodEntry(String methodName, {bool isNullable = false}) {
    final nullableStr = isNullable ? '?' : '';
    return 'R$nullableStr $methodName<R extends Object?>';
  }

// void _writeMixin(StringBuffer buffer) {
//   void _writePatternMatch(
//     String name,
//     StringBuffer buffer, {
//     required Iterable<String> nullableParams,
//     required Iterable<String> requiredParams,
//     String Function(Class)? base,
//     required String Function(Class) maybe,
//     required String Function(Class) orNull,
//     bool mapWithSwitch = false,
//   }) {
//     if (!mapWithSwitch) {
//       assert(base != null, 'base is required when mapWithSwitch is false');
//     }

//     final camelName = name.toCamelCase();
//     final pascalName = name.toPascalCase();

//     buffer
//       ..writeMethod(
//         methodEntry(camelName),
//         params: requiredParams,
//         body: () {
//           if (mapWithSwitch) {
//             buffer.writeObject(
//               'switch (this.runtimeType)',
//               body: () {
//                 buffer
//                   ..writeAll(subtypes.map<String>((e) => e.switchCase))
//                   ..writeln('default:')
//                   ..writeln(
//                     r"throw UnsupportedError('Unsupported type: $this');",
//                   );
//               },
//             );
//           } else {
//             buffer.returnMap(subtypes, base!);
//           }
//         },
//       )
//       ..writeMethod(
//         methodEntry('maybe$pascalName'),
//         params: {
//           ...nullableParams,
//           'required _NoResult<R> orElse',
//         },
//         body: () {
//           buffer.returnMap(subtypes, maybe);
//         },
//       )
//       ..writeMethod(
//         methodEntry('${camelName}OrNull', isNullable: true),
//         params: nullableParams,
//         body: () {
//           buffer.returnMap(subtypes, orNull);
//         },
//       );
//   }

//   final requiredParams =
//       subtypes.map<String>((e) => e.resultArg(isRequired: true));
//   final nullableParams = subtypes.map<String>((e) => e.resultArg());

//   _writePatternMatch(
//     'map',
//     buffer,
//     requiredParams: requiredParams,
//     nullableParams: nullableParams,
//     maybe: (subject) {
//       final varName = subject.nameAsArg;
//       return '$varName: (state) => '
//           '$varName?.call(state) ?? orElse()';
//     },
//     orNull: (subject) {
//       final varName = subject.nameAsArg;
//       return '$varName: (state) => '
//           '$varName?.call(state)';
//     },
//     mapWithSwitch: true,
//   );

//   final requiredWhenParams =
//       subtypes.map<String>((e) => e.whenParams(isRequired: true));
//   final nullableWhenParams = subtypes.map<String>((e) => e.whenParams());

//   _writePatternMatch(
//     'when',
//     buffer,
//     requiredParams: requiredWhenParams,
//     nullableParams: nullableWhenParams,
//     base: (subject) {
//       final varName = subject.nameAsArg;
//       return '$varName: (state) => $varName(${subject.whenArgs})';
//     },
//     maybe: (subject) {
//       final varName = subject.nameAsArg;
//       return '$varName: (state) => '
//           '$varName?.call(${subject.whenArgs}) ?? orElse()';
//     },
//     orNull: (subject) {
//       final varName = subject.nameAsArg;
//       return '$varName: (state) => $varName?.call(${subject.whenArgs})';
//     },
//   );

//   buffer.writeAll(subtypes.map<String>((e) => e.toIsType()), '\n');
// }

}
