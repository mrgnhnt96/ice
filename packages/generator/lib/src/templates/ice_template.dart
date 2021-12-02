import 'package:copywith_plus/src/domain/domain.dart';

/// A template to generate methods for
/// - copyWith()
/// - Equatable Props
/// - toString()
class IceTemplate {
  const IceTemplate.forSubject(Class subject) : _subject = subject;

  final Class _subject;
}
