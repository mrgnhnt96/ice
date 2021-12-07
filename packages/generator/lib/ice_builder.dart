import 'package:build/build.dart';
import 'package:ice/ice.dart';
import 'package:ice/src/ice.dart';
import 'package:ice/src/ice_union.dart';
import 'package:ice/src/method.dart';
import 'package:ice/src/util/unified_generator.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';

/// {@template ice_builder}
/// The builder for generation
/// {@endtemplate}
class IceBuilder extends PackageBuilder {
  /// {@macro ice_builder}
  IceBuilder();

  @override
  String get name => 'IceGenerator';

  @override
  Builder get builder {
    return PartBuilder(
      generators,
      '.ice.dart',
      header: header,
    );
  }

  @override
  List<Generator> get generators => [
        UnifiedGenerator(
          [
            const IceGenerator(),
            const IceUnionGenerator(),
            const MethodGenerator(),
          ],
          name: name,
        )
      ];

  @override
  @visibleForTesting
  Builder Function(BuilderOptions options) get entryPoint => iceBuilder;
}

/// gets the entry point for the builder
typedef TestBuilder = Builder Function(BuilderOptions options);

/// {@template package_builder}
/// The builder for generation
/// {@endtemplate}
abstract class PackageBuilder {
  /// {@macro package_builder}
  PackageBuilder();

  /// the name of the IceGenerator
  String get name;

  /// gets the entry point for the builder
  ///
  /// ! must be annotated with `@visibleForTesting`
  @visibleForTesting
  TestBuilder get entryPoint;

  /// retrieves the builder
  Builder get builder;

  /// the list of generators for the builder
  List<Generator> get generators;

  /// the header for the generated file
  String get header => '''
$ignoreCoverage
$generatedByHand
$ignoreForFile
''';

  /// the list of ignore_for_file
  List<String> get ignores => <String>[];

  /// `// GENERATED CODE - DO NOT MODIFY BY HAND`
  final String generatedByHand = '// GENERATED CODE - DO NOT MODIFY BY HAND';

  /// `// coverage:ignore-file`
  final String ignoreCoverage = '// coverage:ignore-file';

  /// `// ignore_for_file: ${ignores.join(',')}`
  String get ignoreForFile => '// ignore_for_file: ${ignores.join(',')}';
}
