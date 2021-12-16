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
    required this.isCopyWithConstructor,
    required this.params,
    required this.declaration,
    required this.isGenerative,
  });

  /// Gets the constructor from the [ConstructorElement]
  factory Constructor.fromElement(ConstructorElement element) {
    // TODO:  get copyWith from the annotations
    const isCopyWithConstructor = false;

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
      params: params,
      declaration: declaration,
      isGenerative: isGenerative,
      isCopyWithConstructor: isCopyWithConstructor,
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
  final bool isCopyWithConstructor;

  /// The params of the constructor
  final List<Param> params;

  /// the declaration of the constructor
  final String declaration;

  /// if the constructor is the default constructor
  bool get isDefault => name.isEmpty;

  /// If the constructor is named
  bool get isNamed => name.isNotEmpty;

  /// whether the constructor is a named constructor
  /// and not a static or factory constructor
  final bool isGenerative;

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
      final declaration = '$className${constructor.declaration} : '
          '${constructor.superArgs()}\n\n';

      declarations.add(declaration);
    }

    return declarations;
  }
}
