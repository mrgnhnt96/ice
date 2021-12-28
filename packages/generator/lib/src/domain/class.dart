// ignore_for_file: comment_references, implementation_imports, no_default_cases

import 'package:analyzer/dart/element/element.dart';

import 'package:ice/ice.dart';
import 'package:ice/src/domain/class_annotations.dart';
import 'package:ice/src/domain/do_not_generate.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/field.dart';
import 'package:ice/src/domain/ice_settings.dart';

/// {@template class}
/// The class that [IceCopyWith] will be generated for
/// {@endtemplate}
class Class {
  /// {@macro constructor}
  Class({
    required this.constructors,
    required this.annotations,
    required this.fields,
    required this.name,
    required this.doNotGenerate,
  });

  /// Retrieves the class data from the element
  factory Class.fromElement(ClassElement element) {
    final constructors = Constructor.fromElements(element.constructors);
    final annotations = ClassAnnotations.fromElements(element.metadata);
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
  final List<Field> fields;

  /// the elements of the generated code that
  /// should be ignored
  final DoNotGenerate doNotGenerate;

  /// The name of the class
  final String name;

  String? _generatedName;

  /// The name of the class to be generated
  ///
  /// removes the `$` from the name
  String get genName {
    if (_generatedName != null) {
      return _generatedName!;
    }

    final clean = name.replaceAll(r'$', '');
    return _generatedName = '_\$$clean';
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

  /// formats all fields as getters
  ///
  /// ```dart
  /// Type? get name;
  /// ```
  Iterable<String> get fieldGetters {
    final getters = <String>[];

    for (final field in fields) {
      final getter = '${field.type} get ${field.name};';
      var jsonKey = '';
      if (field.jsonKeyDeclaration != null) {
        jsonKey = '${field.jsonKeyDeclaration}\n';
      }

      getters.add(jsonKey + getter);
    }

    return getters;
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
