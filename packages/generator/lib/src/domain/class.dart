// ignore_for_file: comment_references, implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/enums/enums.dart';
import 'package:ice/src/domain/field.dart';
import 'package:ice/src/domain/method.dart';

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
    required this.isAbstract,
    required this.methods,
  }) : _entryPoint = _EntryPoint(constructors);

  /// Retrieves the class data from the element
  factory Class.fromElement(ClassElement element) {
    final constructors = Constructor.fromElements(element.constructors);
    final annotations = Annotation.fromElements(element.metadata);
    final fields = Field.fromElements(element.fields);
    final methods = Method.fromElements(element.methods);
    final isAbstract = element.isAbstract;

    return Class(
      constructors: constructors,
      annotations: annotations,
      fields: fields,
      name: element.displayName,
      isAbstract: isAbstract,
      methods: methods,
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

  /// whether the class is an abstract class
  final bool isAbstract;

  /// the methods in the class
  final List<Method> methods;

  /// The entry point to be used to generate the copyWith method
  Constructor entryPoint() => _entryPoint.access;

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
    final keyword = isAbstract ? 'abstract class' : 'class';

    return '$keyword ${generatedName()} extends $name with EquatableMixin';
  }

  Map<String, bool>? _methodsToIgnore;

  /// returns mapped methods by name with
  /// whether they should be ignored
  Map<String, bool> get methodsToIgnore {
    if (_methodsToIgnore != null) {
      return _methodsToIgnore!;
    }

    final toIgnore = <String, bool>{};

    for (final method in methods) {
      toIgnore[method.name] = method.ignoreOption.ignore;
    }

    return _methodsToIgnore = toIgnore;
  }

  /// whether a method can be generated
  ///
  /// returns false if the method already exists
  bool canGeneratedMethod(IceOptions option) {
    try {
      final iceAnnotation =
          annotations.firstWhere((e) => e.type.isIce) as IceAnnotation;

      final shouldGenerate = iceAnnotation.shouldGenerate(option);

      if (!shouldGenerate) {
        return false;
      }
    } catch (_) {}

    final name = option.name;
    if (methodsToIgnore.containsKey(name)) {
      return methodsToIgnore[name]!;
    }

    return true;
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
      if (constructor.hasCopyWithEntryPointAnnotation) {
        _annotated = constructor;
      } else if (constructor.isDefault) {
        _defaultConst = constructor;
      } else if (constructor.isNamedUnderscore) {
        _namedUnderscore = constructor;
      }
    }
  }
}
