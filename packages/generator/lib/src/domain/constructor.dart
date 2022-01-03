// ignore_for_file: comment_references, implementation_imports

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/ast/ast.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:ice/src/util/element_ext.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

/// {@template constructor}
/// A constructor of the [Class]
/// {@endtemplate}
class Constructor {
  /// {@macro constructor}
  const Constructor({
    required this.name,
    required this.redirectName,
    required this.displayName,
    required this.isCopyWithConstructor,
    required this.params,
    required this.declaration,
    required this.isGenerative,
    required this.isConst,
    required this.isJsonConstructor,
    required this.paramsString,
  });

  /// Gets the constructor from the [ConstructorElement]
  factory Constructor.fromElement(
    ConstructorElement element, {
    required bool retrieveRedirect,
  }) {
    var isCopyWithConstructor = false;
    var isJsonConstructor = false;

    for (final metadata in element.metadata) {
      final name = metadata.astName;
      if (name == CtorAnnotationTypes.copyWith.serialized) {
        isCopyWithConstructor = true;
        continue;
      }
      if (name == CtorAnnotationTypes.fromJson.serialized) {
        isJsonConstructor = true;
        continue;
      }
    }

    String? getRedirectName() {
      final result = element.library.session
          .getParsedLibraryByElement(element.library) as ParsedLibraryResult?;

      final declaration = result?.getElementDeclaration(element);
      final node = declaration?.node as ConstructorDeclarationImpl?;
      if (node == null) {
        throw Exception('Could not find declaration for $element');
      }
      final redirectedConstructor = node.redirectedConstructor;

      if (redirectedConstructor == null) {
        // this constructor is not a redirect
        return null;
      }

      final redirectedClass =
          '$redirectedConstructor'.replaceAll(RegExp(r'<\w+>'), '');

      if (redirectedClass == 'fromJson') {
        /// we don't wanna touch the fromJson constructor
        return null;
      }

      if (redirectedClass.contains(RegExp(r'[^A-z0-9_\$]+'))) {
        // we can't successfully generate the name of this
        // constructor as a class, so we will just ignore it
        return null;
      }

      return redirectedClass;
    }

    String? redirectName;
    if (retrieveRedirect) {
      redirectName = getRedirectName();
    }

    final params = Param.fromElements(element.parameters);

    final declaration = '${element.declaration}'
        .replaceAll(
          element.returnType.getDisplayString(withNullability: true),
          '',
        )
        .trim();
    final paranthesisIndex = declaration.indexOf('(');
    final paramsString = declaration.substring(paranthesisIndex);

    final isGenerative = element.isDefaultConstructor ||
        !(element.isFactory || element.isStatic);

    return Constructor(
      name: element.name,
      redirectName: redirectName,
      displayName: redirectName ?? element.displayName,
      params: params,
      declaration: declaration,
      isGenerative: isGenerative,
      isCopyWithConstructor: isCopyWithConstructor,
      isConst: element.isConst,
      isJsonConstructor: isJsonConstructor,
      paramsString: paramsString,
    );
  }

  /// Gets all constructors for the class from [ConstructorElement]
  static List<Constructor> fromElements(
    List<ConstructorElement> elements, {
    bool retrieveRedirect = false,
  }) {
    final constructors = <Constructor>[];

    for (final element in elements) {
      constructors.add(
        Constructor.fromElement(
          element,
          retrieveRedirect: retrieveRedirect,
        ),
      );
    }

    return constructors;
  }

  /// The name of the constructor
  final String name;

  /// the name of the redirect class
  final String? redirectName;

  /// The name of the constructor with the [Class]'s name
  final String displayName;

  /// The annotation of the constructor
  final bool isCopyWithConstructor;

  /// The params of the constructor
  final List<Param> params;

  /// the declaration of the constructor
  final String declaration;

  /// whether the constructor is const
  final bool isConst;

  /// if the constructor is the default constructor
  bool get isDefault => name.isEmpty;

  /// if the constructor is private
  bool get isPrivate => name.startsWith('_');

  /// If the constructor is named
  bool get isNamed => name.isNotEmpty;

  /// whether the constructor is a generative (named) constructor
  ///
  /// is false if the constructor is factory or static
  final bool isGenerative;

  /// whether the constructor is the factory constructor
  /// for json_serializable
  final bool isJsonConstructor;

  /// the params of the constructor as it is
  /// used in the declaration
  final String paramsString;

  /// converts the constructor to a default
  /// constructor
  Constructor convertToDefault() {
    if (!displayName.contains('.')) {
      return this;
    }

    final className = displayName.split('.').first;

    return Constructor(
      name: '',
      redirectName: null,
      displayName: className,
      params: params,
      declaration: '()',
      paramsString: '()',
      isGenerative: true,
      isCopyWithConstructor: true,
      isConst: true,
      isJsonConstructor: true,
    );
  }

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

  /// formats the params as args
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

    return args.join(',$pln');
  }
}

/// ext for List<Constructor>
extension ListConstructorX on List<Constructor> {
  /// gets the declarations of all constructors
  Iterable<String> declarations(String className) {
    final declarations = <String>[];

    for (final constructor in this) {
      final declaration = '$className${constructor.declaration} : '
          '${constructor.superArgs()}';

      declarations.add(declaration);
    }

    return declarations;
  }
}
