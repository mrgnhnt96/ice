import 'package:ice/src/domain/domain.dart';

/// The abstraction for a template
abstract class Template {
  /// Creates the template with the [subject]
  const Template(this.subject);

  /// adds the template to the [buffer]
  void addToBuffer(StringBuffer buffer);

  /// The subject of the template
  final Class subject;
}
