// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/ice.dart';
import 'package:ice/src/templates/templates.dart';

/// A template to generate methods for
/// - copyWith()
/// - Equatable Props
/// - toString()
class IceUnionBaseTemplate extends Template {
  IceUnionBaseTemplate.forSubject(Class subject) : super(subject);

  List<Class> get subtypes =>
      _subtypes ??= IceGenerator.subjects.getUnions(subject.name);
  List<Class>? _subtypes;

  @override
  void addToBuffer(StringBuffer buffer) {
    // TODO: implement addToBuffer
  }

  @override
  String toString() {
    return '// TODO: implement toString';
  }
}
