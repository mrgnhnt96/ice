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
import 'package:ice/src/ice.dart';
import 'package:ice/src/method.dart';
import 'package:ice/src/union.dart';
import 'package:ice/src/util/unified_generator.dart';
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
const _ignores = <String>[];

/// the list of ignore_for_file for the generated file
final iceIgnoreForFile = '// ignore_for_file: ${_ignores.join(',')}'.trim();

/// the header to use for generated file
String get iceHeader => '''
// coverage:ignore-file
$defaultFileHeader
$iceIgnoreForFile
''';

/// the extension of the generated file
const iceExtension = '.ice.dart';

/// Not meant to be invoked by hand-authored code.
Builder iceBuilder(BuilderOptions options) {
  // get settings from the build file
  iceSettings = IceSettings.fromOptions(options.config);

  return PartBuilder(
    [
      const UnifiedGenerator(
        [
          IceGenerator(),
          MethodGenerator(),
          UnionGenerator(),
        ],
        name: 'IceGenerator',
      )
    ],
    '.ice.dart',
    header: iceHeader,
  );
}
