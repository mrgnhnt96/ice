import 'package:build/build.dart';
import 'package:ice/ice.dart';
import 'package:ice/src/domain/package_builder.dart';
import 'package:ice/src/ice.dart';
import 'package:ice/src/method.dart';
import 'package:ice/src/util/unified_generator.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';

/// {@template ice_builder}
/// The builder for generation
/// {@endtemplate}
class IceBuilder extends PackageBuilder {
  /// {@macro ice_builder}
  const IceBuilder() : super(name: 'IceGenerator', extension: '.ice.dart');

  @override
  List<Generator> get generators => [
        UnifiedGenerator(
          [
            const IceGenerator(),
            const MethodGenerator(),
          ],
          name: name,
        )
      ];

  @override
  @visibleForTesting
  Builder Function(BuilderOptions options) get entryPoint => iceBuilder;
}
