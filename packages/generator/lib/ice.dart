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
import 'package:ice/ice_builder.dart';
import 'package:ice/src/domain/ice_settings.dart';
import 'package:meta/meta.dart';

/// the settings for the [IceBuilder] from the build.yaml file
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

/// Not meant to be invoked by hand-authored code.
Builder iceBuilder(BuilderOptions options) {
  // get settings from the build file
  iceSettings = IceSettings.fromOptions(options.config);
  const ice = IceBuilder();

  return ice.builder;
}
