// ignore_for_file: comment_references, implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
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
    required this.supertypes,
    required this.isAbstract,
  }) : _entryPoint = _EntryPoint(constructors);

  /// Retrieves the class data from the element
  factory Class.fromElement(ClassElement element) {
    final constructors = Constructor.fromElements(element.constructors);
    final annotations = Annotation.fromElements(element.metadata);
    final fields = Field.fromElements(element.fields);
    final isAbstract = element.isAbstract;

    Set<String> _getSuperTypes(List<InterfaceType> interfaces) {
      final items = <String>{};

      if (interfaces.length <= 1) {
        return items;
      }

      for (final interface in interfaces) {
        final name = interface.element.name;

        if (name == 'Object') {
          continue;
        }

        items
          ..add(name)
          ..addAll(_getSuperTypes(interface.allSupertypes));
      }

      return items;
    }

    final supertypes = _getSuperTypes(element.allSupertypes);

    return Class(
      constructors: constructors,
      annotations: annotations,
      fields: fields,
      name: element.displayName,
      supertypes: supertypes.toList(),
      isAbstract: isAbstract,
    );
  }

  /// The list of constructors in the class
  final List<Constructor> constructors;

  /// the annotations in the class
  final List<Annotation> annotations;

  /// the fields in the class
  final List<Field> fields;

  /// The name of the class
  final String name;

  final _EntryPoint _entryPoint;

  /// all the super types of the class
  final List<String> supertypes;

  /// whether the class is an abstract class
  final bool isAbstract;

  /// The entry point to be used to generate the copyWith method
  Constructor entryPoint() => _entryPoint.access;

  /// maps the super types to this class
  Map<String, Class> supertypeMap() {
    final supers = <String, Class>{};

    for (final supertype in supertypes) {
      supers[supertype] = this;
    }

    return supers;
  }

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

    final startsWithDollar = name.contains(r'$');

    final mustBeGenClass = Exception(
      'Class name $name must start with \$ to '
      'successfully generate as a private class',
    );

    if (!startsWithDollar) {
      throw mustBeGenClass;
    }

    return generatedName(retainPrivate: retainPrivate);
  }
}

class _EntryPoint {
  _EntryPoint(this._constructors);

  final List<Constructor> _constructors;

  var _hasSetAccess = false;
  Constructor? _annotated;
  Constructor? _defaultConst;
  Constructor? _namedUnderscore;

  Constructor get access {
    if (!_hasSetAccess) {
      _setAccess();
    }

    final result = _annotated ?? _defaultConst ?? _namedUnderscore;

    if (result == null) {
      throw Exception('No entry point found');
    }

    return result;
  }

  void _setAccess() {
    _hasSetAccess = true;

    if (_constructors.isEmpty) {
      throw Exception('No constructor found');
    }

    for (final constructor in _constructors) {
      if (constructor.hasEntryPointAnnotation) {
        _annotated = constructor;
      } else if (constructor.isDefault) {
        _defaultConst = constructor;
      } else if (constructor.isNamedUnderscore) {
        _namedUnderscore = constructor;
      }
    }
  }
}
