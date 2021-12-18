// ignore_for_file: comment_references, implementation_imports, no_default_cases

import 'package:analyzer/dart/element/element.dart';
import 'package:ice/ice.dart';
import 'package:ice/src/domain/class_annotations.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/field.dart';
import 'package:ice/src/domain/ice_settings.dart';

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

  /// whether a method can be generated
  ///
  /// returns false if the method already exists
  bool canGeneratedMethod(IceOptions option) {
    switch (option) {
      case IceOptions.copyWith:
        return metaSettings(
          iceCallback: (ice) => ice.copyWith,
          methodCallback: (method) => method.hasCopyWith,
          settingsCallback: (settings) => settings.copyWith,
        );
      case IceOptions.equatable:
        return metaSettings(
          iceCallback: (ice) => ice.equatable,
          methodCallback: (methods) => methods.hasProps,
          settingsCallback: (settings) => settings.equatable,
        );
      case IceOptions.tostring:
        return metaSettings(
          iceCallback: (ice) => ice.tostring,
          methodCallback: (methods) => methods.hasToString,
          settingsCallback: (settings) => settings.tostring,
        );
      case IceOptions.toJson:
        return annotations.createToJson;
      case IceOptions.other:
        return true;
    }
  }

  /// the constructor to be used to to generate the copyWith method
  Constructor? copyWithConstructor() {
    if (constructors.isEmpty) return null;

    final copyWithIndex =
        constructors.indexWhere((c) => c.isCopyWithConstructor);

    if (copyWithIndex != -1) {
      return constructors[copyWithIndex];
    }

    final defaultIndex = constructors.indexWhere((c) => c.isDefault);

    if (defaultIndex != -1) {
      return constructors[defaultIndex];
    }

    return constructors.first;
  }

  /// removes all `_` from the start of the name
  String get nonPrivateName {
    return name.replaceFirst(RegExp('^_+'), '');
  }

  /// removes all `_` and `$`
  String get cleanName {
    return name.replaceFirst(RegExp(r'^[_|$]+'), '');
  }

  /// formats all fields as getters
  ///
  /// ```dart
  /// Type? get name;
  /// ```
  Iterable<String> get fieldGetters {
    final getters = <String>[];

    for (final field in fields) {
      getters.add('${field.type} get ${field.name};');
    }

    return getters;
  }
}
