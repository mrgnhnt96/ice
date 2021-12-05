// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: parameter_assignments

/// Configuration for using `package:build`-compatible build systems.
///
/// See:
/// * [build_runner](https://pub.dev/packages/build_runner)
///
/// This library is **not** intended to be imported by typical end-users unless
/// you are creating a custom compilation pipeline. See documentation for
/// details, and `build.yaml` for how these builders are configured by default.
import 'package:build/build.dart';
import 'package:ice/src/copywith.dart';
import 'package:ice/src/ice.dart';
import 'package:ice/src/ice_union_base.dart';
import 'package:json_serializable/builder.dart' as i;
import 'package:source_gen/source_gen.dart';

/// Not meant to be invoked by hand-authored code.
Builder iceBuilder(BuilderOptions options) {
  // get settings from the build file
  const ignores = <String>[];

  return PartBuilder(
    [
      const _UnifiedGenerator([
        CopyWithGenerator(),
        IceGenerator(),
        IceUnionBaseGenerator(),
      ])
    ],
    '.ice.dart',
    header: '''
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: ${ignores.join(',')}
''',
  );
}

/// json_serializable builder
Builder iceJsonSerializable(BuilderOptions options) =>
    i.jsonSerializable(options);

/// Allows exposing separate [GeneratorForAnnotation] instances as one
/// generator.
///
/// We want duplicate items to be merged if folks use both `@JsonEnum` and
/// `@JsonSerializable` so we don't get duplicate enum helper functions.
///
/// This can only be done if the output is merged into one generator.
///
/// This class allows us to keep the implementations separate.
class _UnifiedGenerator extends Generator {
  const _UnifiedGenerator(this._generators);

  final List<GeneratorForAnnotation> _generators;

  @override
  Future<String?> generate(LibraryReader library, BuildStep buildStep) async {
    final values = <String>{};

    for (final generator in _generators) {
      final lib = library.annotatedWith(generator.typeChecker);
      for (final annotatedElement in lib) {
        final generatedValue = generator.generateForAnnotatedElement(
          annotatedElement.element,
          annotatedElement.annotation,
          buildStep,
        ) as String;

        final output = _normalizeGeneratorOutput(generatedValue);

        for (final value in output) {
          assert(
            value.length == value.trim().length,
            'The value is not trimmed',
          );

          values.add(value);
        }
      }
    }

    return values.join('\n\n');
  }

  @override
  String toString() => 'IceGenerator';
}

// Borrowed from `package:source_gen`
Iterable<String> _normalizeGeneratorOutput(Object? value) {
  if (value == null) {
    return const [];
  } else if (value is String) {
    value = [value];
  }

  if (value is Iterable<String?>) {
    return value.whereType<String>().map<String>((e) {
      if (e is String) {
        return e.trim();
      }

      throw _argError(e);
    }).where((e) => e.isNotEmpty);
  }
  throw _argError(value);
}

// Borrowed from `package:source_gen`
ArgumentError _argError(Object value) => ArgumentError(
      'Must be a String or be an Iterable containing String values. '
      'Found `${Error.safeToString(value)}` (${value.runtimeType}).',
    );
