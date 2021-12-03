// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';

/// A template to generate methods for
/// - copyWith()
/// - Equatable Props
/// - toString()
class IceTemplate {
  const IceTemplate.forSubject(Class subject) : _subject = subject;

  final Class _subject;

  @override
  String toString() => '';
}
