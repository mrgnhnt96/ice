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
import 'package:ice/src/domain/ice_settings.dart';
import 'package:ice/src/generator.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';

/// the settings from the build.yaml file
IceSettings get iceSettings {
  final settings = _iceSettings;

  if (settings == null) {
    throw StateError('iceSettings is not set');
  }

  return settings;
}

@visibleForTesting
set iceSettings(IceSettings value) {
  _iceSettings = value;
}

IceSettings? _iceSettings;

/// the list of ignore_for_file
const _ignores = <String>[
  'cast_nullable_to_non_nullable',
  'unnecessary_raw_strings',
  'annotate_overrides',
  'require_trailing_commas',
  'unnecessary_cast',
  'implicit_dynamic_type',
  'lines_longer_than_80_chars',
];

/// the list of ignore_for_file for the generated file
final iceIgnoreForFile = '// ignore_for_file: ${_ignores.join(',')}'.trim();

/// the extension of the generated file
const iceExtension = '.ice.dart';

/// Not meant to be invoked by hand-authored code.
Builder iceBuilder(BuilderOptions options) {
  // get settings from the build file
  iceSettings = IceSettings.fromOptions(options.config);

  Formatter? formatter = (str) => str;

  if (iceSettings.formatOutput) {
    formatter = null;
  }

  final iceHeader = '''
// coverage:ignore-file
$defaultFileHeader
$iceIgnoreForFile
''';

  return PartBuilder(
    [const IceGenerator()],
    iceExtension,
    header: iceHeader,
    formatOutput: formatter,
  );
}

/// the Formatter for the generated file
typedef Formatter = String Function(String);
