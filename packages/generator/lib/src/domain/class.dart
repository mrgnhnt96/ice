// ignore_for_file: comment_references, implementation_imports, no_default_cases

import 'package:analyzer/dart/element/element.dart';
import 'package:change_case/src/change_case.dart';
import 'package:ice/ice.dart';
import 'package:ice/src/domain/annotations/annotations.dart';
import 'package:ice/src/domain/do_not_generate.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/field.dart';
import 'package:ice/src/domain/ice_settings.dart';
import 'package:ice/src/util/iterable_ext.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

/// {@template class}
/// The class that [IceCopyWith] will be generated for
/// {@endtemplate}
class Class {
  /// {@macro constructor}
  const Class({
    required this.constructors,
    required this.annotations,
    required this.fields,
    required this.name,
    required this.doNotGenerate,
  });

  /// Retrieves the class data from the element
  factory Class.fromElement(ClassElement element) {
    final annotations = ClassAnnotations.fromElements(element.metadata);

    final constructors = Constructor.fromElements(
      element.constructors,
      retrieveRedirect: annotations.isContainedUnion,
    );

    late DoNotGenerate doNotGenerate;
    if (annotations.isMethodAnnotation) {
      doNotGenerate = const DoNotGenerate.none();
    } else {
      doNotGenerate = DoNotGenerate.fromElement(element);
    }

    final fields = Field.fromElements(
      element.fields,
      ignoreGettersAsProps: annotations.ice?.ignoreGettersAsProps ??
          iceSettings.ignoreGettersAsProps,
    );

    return Class(
      constructors: constructors,
      annotations: annotations,
      fields: fields,
      name: element.displayName,
      doNotGenerate: doNotGenerate,
    );
  }

  /// The list of constructors in the class
  final List<Constructor> constructors;

  /// the annotations in the class
  final ClassAnnotations annotations;

  /// the fields in the class
  final Iterable<Field> fields;

  /// the elements of the generated code that
  /// should be ignored
  final DoNotGenerate doNotGenerate;

  /// The name of the class
  final String name;

  /// The name of the class to be generated
  ///
  /// removes the `$` from the name
  String get genName {
    final clean = nonPrivateName.replaceAll(r'$', '');
    return '_\$$clean';
  }

  /// checks settings from annotations, ([methodCallback], [iceCallback])
  /// then build configuration ([settingsCallback])
  T metaSettings<T>({
    required T? Function(MethodAnnotations) methodCallback,
    required T? Function(IceAnnotation) iceCallback,
    required T Function(IceSettings) settingsCallback,
  }) {
    final methods = annotations.methods;
    final ice = annotations.ice;

    if (methods != null) {
      final result = methodCallback(methods);

      if (result != null) {
        return result;
      }
    }

    if (ice != null) {
      final result = iceCallback(ice);

      if (result != null) {
        return result;
      }
    }

    return settingsCallback(iceSettings);
  }

  /// removes all `_` from the start of the name
  String get nonPrivateName {
    return name.replaceFirst(RegExp('^_+'), '');
  }

  /// removes all `_` and `$`
  String get cleanName {
    return name.replaceFirst(RegExp(r'^[_|$]+'), '');
  }

  /// the name of the union base class
  String get unionBase {
    return '_\$${cleanName}Union';
  }

  /// gets the name formatted in camelCase
  String get nameAsArg => nonPrivateName.toCamelCase();

  /// returns the default constructor if no constructors match [predicate]\
  /// returns first constructor if no default constructor is found\
  /// returns null if no constructors are found
  Constructor? constructorWhere([bool Function(Constructor)? predicate]) {
    if (constructors.isEmpty) return null;

    Constructor? defaultCtor;
    for (final ctor in constructors) {
      if (predicate?.call(ctor) ?? false) {
        return ctor;
      }

      if (ctor.isDefault) {
        defaultCtor = ctor;
      }

      if (defaultCtor != null && predicate == null) {
        return defaultCtor;
      }
    }

    return defaultCtor ?? constructors.first;
  }

  /// formats all fields as properties
  ///
  /// ```dart
  /// abstract
  /// Type? get name;
  ///
  /// impl
  /// final Type? name;
  /// ```
  Iterable<String> get fieldProperties {
    final properties = <String>[];

    for (final field in fields) {
      final getter = '${field.type} get ${field.name};';
      var jsonKey = '';
      if (field.jsonKeyDeclaration != null) {
        jsonKey = '${field.jsonKeyDeclaration}$pln';
      }

      properties.add(jsonKey + getter);
    }

    return properties;
  }

  @override
  String toString() {
    return 'Class('
        'name: $name, '
        'constructors: ${constructors.length}, '
        'annotations: $annotations, '
        'fields: ${fields.length}, '
        ')';
  }
}

/// class for a contained union
class ContainedClass extends Class {
  const ContainedClass._({
    required String name,
    required ClassAnnotations annotations,
    required Iterable<Field> fields,
    required DoNotGenerate doNotGenerate,
    required this.unionBase,
    required List<Constructor> constructors,
  }) : super(
          annotations: annotations,
          constructors: constructors,
          doNotGenerate: doNotGenerate,
          fields: fields,
          name: name,
        );

  /// creates a new class based from a constructor
  factory ContainedClass.subUnion(Constructor ctor, Class union) {
    final className = ctor.redirectName;

    if (className == null) {
      throw 'Constructor must be a redirect constructor';
    }

    final fields = ctor.params.map(Field.fromParam);

    final annotations = union.annotations.unionFor(className, union.name);

    const doNotGenerate = DoNotGenerate.none();
    final defaultCtor = ctor.convertToDefault();

    return ContainedClass._(
      annotations: annotations,
      doNotGenerate: doNotGenerate,
      fields: fields,
      name: className,
      unionBase: union.name,
      constructors: [defaultCtor],
    );
  }

  /// creates a contained class based from the [union]
  factory ContainedClass.union(Class union) {
    String missingException() {
      return '${union.name} does not have the private (generative) constructor '
          'needed to create the union '
          'please add `${union.name}._();` as the constructor';
    }

    final filteredCtors =
        union.constructors.where((ctor) => ctor.isGenerative && ctor.isPrivate);

    if (filteredCtors.isEmpty) {
      throw missingException();
    }

    final privateCtor =
        filteredCtors.firstWhereOrNull((ctor) => ctor.name == '_');

    if (privateCtor == null) {
      throw missingException();
    }

    if (privateCtor.params.isNotEmpty) {
      throw '${union.name} constructor must have no parameters'
          'should be ${union.name}._();}';
    }

    return ContainedClass._(
      annotations: union.annotations,
      doNotGenerate: union.doNotGenerate,
      fields: [],
      constructors: [privateCtor],
      name: union.name,
      unionBase: union.name,
    );
  }

  @override
  final String unionBase;

  @override
  Iterable<String> get fieldProperties {
    return fields.map((f) => 'final ${f.type} ${f.name};');
  }

  @override
  String get genName {
    if (annotations.isUnionBase) {
      return super.genName;
    }
    return name;
  }
}
