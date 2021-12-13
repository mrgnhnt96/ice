// ignore_for_file: comment_references

import 'package:analyzer/dart/element/element.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/enums.dart';

/// {@template constructor}
/// A constructor of the [Class]
/// {@endtemplate}
class Constructor {
  /// {@macro constructor}
  const Constructor({
    required this.name,
    required this.displayName,
    required this.annotations,
    required this.params,
    required this.declaration,
    required this.isConst,
    required this.isPrivate,
    required this.ignoreOption,
    required this.isGenerative,
  });

  /// Gets the constructor from the [ConstructorElement]
  factory Constructor.fromElement(ConstructorElement element) {
    final annotations = Annotation.fromElements(element.metadata);
    final params = Param.fromElements(element.parameters);

    final declaration = '${element.declaration}'
        .replaceAll(
          element.returnType.getDisplayString(withNullability: true),
          '',
        )
        .trim();

    final isGenerative = element.isDefaultConstructor ||
        !(element.isFactory || element.isStatic);

    return Constructor(
      name: element.name,
      displayName: element.displayName,
      annotations: annotations,
      params: params,
      declaration: declaration,
      isConst: element.isConst,
      isPrivate: element.isPrivate,
      isGenerative: isGenerative,
      ignoreOption:
          const ConstructorToIgnoreConv(defaultValue: ConstructorToIgnore.other)
              .fromJson(element.name),
    );
  }

  /// Gets all constructors for the class from [ConstructorElement]
  static List<Constructor> fromElements(List<ConstructorElement> elements) {
    final constructors = <Constructor>[];

    for (final element in elements) {
      constructors.add(Constructor.fromElement(element));
    }

    return constructors;
  }

  /// The name of the constructor
  final String name;

  /// The name of the constructor with the [Class]'s name
  final String displayName;

  /// The annotation of the constructor
  final List<Annotation> annotations;

  /// The params of the constructor
  final List<Param> params;

  /// the domain of the constructor
  final String declaration;

  /// if the constructor is a const
  final bool isConst;

  /// If the constructor is named privately
  final bool isPrivate;

  /// determine if the constructor is an
  /// option that will be generated
  ///
  /// if the option is `other` then the constructor
  /// will be generated
  final ConstructorToIgnore ignoreOption;

  /// Whether the constructor is the copyWith entry point\
  /// determined by the [CopyWithEntryPoint] annotation
  bool get hasEntryPointAnnotation {
    return annotations.any((annotation) => annotation.type.isEntryPoint);
  }

  /// if the constructor is the default constructor
  bool get isDefault => name.isEmpty;

  /// If the constructor is named
  bool get isNamed => !isDefault;

  /// whether the constructor is a named constructor
  /// and not a static or factory constructor
  final bool isGenerative;

  /// If the constructor is underscore named
  bool get isNamedUnderscore => name == '_';

  /// gets the args wrapped in a super call
  String superArgs() {
    var entryPoint = '';

    if (!isDefault) {
      entryPoint = '.$name';
    }

    final args = <String>{}
      ..add('super$entryPoint(')
      ..addAll(params.map((e) => '${e.arg},'))
      ..add(');');

    if (args.length > 2) {
      return args.join(' ');
    }

    return args.join();
  }
}

/// ext for List<Constructor>
extension ListConstructorX on List<Constructor> {
  /// gets the declarations of all constructors
  Iterable<String> declarations(String className) {
    final declarations = <String>[];

    for (final constructor in this) {
      if (constructor.ignoreOption.ignore) {
        continue;
      }

      final declaration = '$className${constructor.declaration} : '
          '${constructor.superArgs()}\n\n';

      declarations.add(declaration);
    }

    return declarations;
  }
}
