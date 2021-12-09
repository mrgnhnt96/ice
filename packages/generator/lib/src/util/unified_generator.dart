// ignore_for_file: parameter_assignments

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

/// {@template unified_generator}
/// Allows exposing separate [GeneratorForAnnotation] instances as one
/// generator.
///
/// We want duplicate items to be merged if folks use both `@JsonEnum` and
/// `@JsonSerializable` so we don't get duplicate enum helper functions.
///
/// This can only be done if the output is merged into one generator.
///
/// This class allows us to keep the implementations separate.
/// {@endtemplate}
class UnifiedGenerator extends Generator {
  /// {@macro unified_generator}
  const UnifiedGenerator(
    this._generators, {
    required this.name,
  });

  final List<GeneratorForAnnotation> _generators;

  /// the name of the generator
  ///
  /// gets inserted into the generated code
  final String name;

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
  String toString() => name;
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
      return e.trim();
    }).where((e) => e.isNotEmpty);
  }
  throw _argError(value);
}

// Borrowed from `package:source_gen`
ArgumentError _argError(Object value) => ArgumentError(
      'Must be a String or be an Iterable containing String values. '
      'Found `${Error.safeToString(value)}` (${value.runtimeType}).',
    );
