// ignore_for_file: comment_references, implementation_imports

import 'package:ice/src/domain/domain.dart';
import 'package:ice_annotation/src/ice.dart';

/// {@template unions}
/// All classes that are annotated with [Ice]
/// {@endtemplate}
class IceSubjects {
  /// {@macro unions}
  IceSubjects() {
    _unions = {};
    _classes = {};
  }

  late final Map<String, List<Class>> _unions;
  late final Map<String, Class> _classes;

  /// gets the classes assotiated with the union [base]
  List<Class> getUnions(String base) => _unions[base] ?? [];

  /// If the [subject] is a union, it's appended to the list of
  /// unions assotiated with the [IceUnionBase]
  void _addIfUnion(Class subject) {
    if (!subject.isIceUnion) {
      return;
    }

    (_unions[subject.unionBaseName!] ??= []).add(subject);
  }

  /// adds the [subject] to the list of [Ice] classes
  void add(Class subject) {
    if (subject.isOther) {
      return;
    }

    _addIfUnion(subject);

    _classes[subject.name] = subject;
  }
}
