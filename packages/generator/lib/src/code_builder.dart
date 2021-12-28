// ignore_for_file: comment_references

import 'package:ice/src/domain/class.dart';
import 'package:ice/src/templates/templates.dart';

/// {@template code_builder}
/// A class that generates code.
/// {@endtemplate}
class CodeBuilder {
  /// {@template code_builder_generate}
  CodeBuilder(this.classes) {
    iceClasses = <String, Class>{};
    subUnionClasses = <String, List<Class>>{};
    unionClasses = <String, Class>{};
    methodClasses = <String, Class>{};

    for (final subject in classes) {
      final annotations = subject.annotations;

      if (annotations.isIceAnnotation) {
        iceClasses.add(subject);

        if (annotations.isUnionBase) {
          unionClasses.add(subject);
        } else if (annotations.isUnionType) {
          /// sorts classes by the union name
          final unionType = annotations.ofUnionType!;
          (subUnionClasses[unionType] ??= []).add(subject);
        }
      } else if (annotations.isMethodAnnotation) {
        methodClasses.add(subject);
      }
    }
  }

  /// the subject to generate code for
  final Iterable<Class> classes;

  /// the classes that are annotated with [Ice]
  late final Map<String, Class> iceClasses;

  /// the classes that are annotated with [IceUnion]`.of`
  late final Map<String, List<Class>> subUnionClasses;

  /// the classes that are annotated with [IceUnion]`.create`
  late final Map<String, Class> unionClasses;

  /// the classes that are annotated with ice annotations,
  /// non [Ice] or [IceUnion]
  late final Map<String, Class> methodClasses;

  /// generates the code for [methodClasses]
  StringBuffer generateMethods([StringBuffer? _buffer]) {
    final buffer = _buffer ?? StringBuffer();

    for (final subject in methodClasses.values) {
      MethodTemplate.forSubject(subject).addToBuffer(buffer);
    }

    return buffer;
  }

  /// generates the code for [unionClasses]
  StringBuffer generateUnions([StringBuffer? _buffer]) {
    final buffer = _buffer ?? StringBuffer();

    for (final subject in unionClasses.entries) {
      final subClasses = subUnionClasses[subject.key];

      UnionTemplate.forSubject(subject.value, subClasses ?? [])
          .addToBuffer(buffer);
    }

    return buffer;
  }

  /// generates the code for [iceClasses]
  StringBuffer generateIceClasses([StringBuffer? _buffer]) {
    final buffer = _buffer ?? StringBuffer();

    for (final subject in iceClasses.values) {
      final unionType = subject.annotations.ofUnionType;
      Class? union;

      if (unionType != null) {
        union = unionClasses[unionType];
      }

      IceTemplate.forSubject(subject, union: union).addToBuffer(buffer);
    }

    return buffer;
  }

  /// generates the code for [classes]
  StringBuffer generate([StringBuffer? _buffer]) {
    final buffer = _buffer ?? StringBuffer();

    generateMethods(buffer);
    generateUnions(buffer);
    generateIceClasses(buffer);

    return buffer;
  }
}

extension on Map {
  void add(Class subject) {
    this[subject.name] = subject;
  }
}
