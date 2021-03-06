// ignore_for_file: comment_references

import 'package:ice/src/domain/class.dart';
import 'package:ice/src/templates/tear_off_template.dart';
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

        final union = annotations.union;

        if (union == null) {
          continue;
        }

        if (union.isBase) {
          unionClasses.add(subject);
        } else if (union.isSubUnion) {
          /// sorts classes by the union name
          final unionType = union.ofUnionType!;
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

  /// generates the code for [classes]
  StringBuffer generate([StringBuffer? _buffer]) {
    final buffer = _buffer ?? StringBuffer();

    generateIceClasses(buffer);
    generateUnions(buffer);
    generateMethods(buffer);

    return buffer;
  }

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

      if (subClasses != null) {
        TearOffTemplate.forSubject(subject.value, subClasses)
            .addToBuffer(buffer);
      }

      UnionMixinTemplate.forSubject(subject.value, subClasses ?? [])
          .addToBuffer(buffer);
    }

    return buffer;
  }

  /// generates the code for [iceClasses]
  StringBuffer generateIceClasses([StringBuffer? _buffer]) {
    final buffer = _buffer ?? StringBuffer();

    for (final subject in iceClasses.values) {
      final unionType = subject.annotations.union?.ofUnionType;
      Class? union;

      if (unionType != null) {
        union = unionClasses[unionType];
      }

      IceClassTemplate.forSubject(subject, union: union).addToBuffer(buffer);
    }

    return buffer;
  }
}

extension on Map {
  void add(Class subject) {
    this[subject.name] = subject;
  }
}
