// ignore_for_file: comment_references

import 'package:analyzer/dart/element/element.dart';
import 'package:copywith_annotation/copywith.dart';
import 'package:copywith_plus/src/domain/domain.dart';
import 'package:copywith_plus/src/domain/field.dart';

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
  }) : _entryPoint = _EntryPoint(constructors) {
    _checkForAnnotationTypes();
  }

  /// Retrieves the class data from the element
  factory Class.fromElement(ClassElement element) {
    final constructors = Constructor.fromElements(element.constructors);
    final annotations = Annotation.fromElements(element.metadata);
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
  final List<Annotation> annotations;

  /// the fields in the class
  final List<Field> fields;

  /// The name of the class
  final String name;

  final _EntryPoint _entryPoint;

  /// The entry point to be used to generate the copyWith method
  Constructor entryPoint() => _entryPoint.access;

  void _checkForAnnotationTypes() {
    for (final annotate in annotations) {
      if (annotate.isIce) {
        _isIce = true;
      } else if (annotate.isIceUnion) {
        _isIceUnion = true;
      } else if (annotate.isUnionBase) {
        _isUnionBase = true;
      }
    }
  }

  var _isIce = false;

  /// Returns true class has annotation for [Ice] or [IceUnion]
  bool get isIce => _isIce;

  var _isIceUnion = false;

  /// returns true class has annotation for [IceUnion]
  bool get isIceUnion => _isIceUnion;

  var _isUnionBase = false;

  /// returns true class has annotation for [IceUnionBase]
  bool get isUnionBase => _isUnionBase;
}

class _EntryPoint {
  const _EntryPoint(this._constructors);

  final List<Constructor> _constructors;

  static bool _hasSetAccess = false;
  static Constructor? _annotated;
  static Constructor? _defaultConst;
  static Constructor? _namedUnderscore;

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
