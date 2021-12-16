// ignore_for_file: comment_references, implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/field.dart';

/// {@template class}
/// The class that [CopyWith] will be generated for
/// {@endtemplate}
class Class {
  /// {@macro constructor}
  Class({
    required this.constructors,
    required this.annotations,
    required this.fields,
    required this.name,
  });

  /// Retrieves the class data from the element
  factory Class.fromElement(ClassElement element) {
    final constructors = Constructor.fromElements(element.constructors);
    final annotations = ClassAnnotations.fromElements(element.metadata);
    final fields = Field.fromElements(element.fields);

    return Class(
      constructors: constructors,
      annotations: annotations,
      fields: fields,
      name: element.displayName,
    );
  }

  /// The list of constructors in the class
  final List<Constructor> constructors;

  /// the annotations in the class
  final ClassAnnotations annotations;

  /// the fields in the class
  final List<Field> fields;

  /// The name of the class
  final String name;

  String? _generatedName;

  /// The name of the class to be generated
  ///
  /// removes the `$` from the name
  String generatedName({
    bool retainPrivate = true,
    bool throwOnNameFormat = false,
  }) {
    final genName = _generatedName;

    if (genName != null) {
      if (!retainPrivate) {
        return genName.replaceAll('_', '');
      }

      return genName;
    }

    _generatedName = name.replaceAll(r'$', '');

    if (!throwOnNameFormat) {
      return generatedName(retainPrivate: retainPrivate);
    }

    return generatedName(retainPrivate: retainPrivate);
  }

  /// checks for abstract then returns
  ///
  /// (abstract)? class extends [name] with EquatableMixin
  String get classEntry {
    return 'abstract class ${generatedName()} extends $name with EquatableMixin';
  }

  /// whether a method can be generated
  ///
  /// returns false if the method already exists
  bool canGeneratedMethod(IceOptions option) {
    // TODO: check if should generate
    // final shouldGenerate = annotations.ice?.shouldGenerate(option) ?? false;

    return true;
  }
}

class ClassAnnotations {
  ClassAnnotations({
    required this.ice,
    required this.methods,
    required this.unionType,
  });

  factory ClassAnnotations.fromElements(List<ElementAnnotation> elements) {
    IceAnnotation? ice;
    MethodAnnotations? methods;
    String? unionType;

    for (final annotation in elements) {
      print(annotation);
    }

    return ClassAnnotations(
      ice: ice,
      methods: methods,
      unionType: unionType,
    );
  }

  final IceAnnotation? ice;
  final MethodAnnotations? methods;

  /// the union type
  final String? unionType;
}
