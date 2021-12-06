// ignore_for_file: comment_references, implementation_imports

import 'package:ice/src/domain/domain.dart';
import 'package:ice_annotation/src/ice.dart';

/// {@template unions}
/// All classes that are annotated with [Ice]
/// {@endtemplate}
class IceSubjects {
  /// {@macro unions}
  IceSubjects() {
    _classes = {};
  }

  late final Map<String, List<Class>> _classes;

  /// gets the classes assotiated with the union [base]
  List<Class> getClasses(String base) => _classes[base] ?? [];

  /// adds the [subject] to the list of [Ice] classes
  /// mapped by supertypes
  void add(Class subject) {
    if (subject.isOther) {
      return;
    }

    final subjectMap = subject.supertypeMap();

    for (final entry in subjectMap.entries) {
      if (!_classes.containsKey(entry.key)) {
        _classes[entry.key] = [];
      }

      _classes[entry.key]!.add(entry.value);
    }
  }
}
