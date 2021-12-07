import 'package:ice/src/domain/domain.dart';

/// The abstraction for a template
abstract class Template {
  /// Creates the template with the [subject]
  const Template(
    this.subject, {
    required this.name,
    required this.type,
  });

  /// The template when it wraps sub-templates
  const Template.wrapper(this.subject)
      : name = '',
        type = TemplateType.none;

  /// adds the template to the [buffer]
  void addToBuffer(StringBuffer buffer);

  /// The subject of the template
  final Class subject;

  /// the name of the method/constructor to be generated
  final String name;

  /// the type of the template
  final TemplateType type;

  /// whether the template can be generated
  ///
  /// should be called before [addToBuffer] or [toString]
  bool get canBeGenerated {
    if (type == TemplateType.none) {
      return true;
    }

    if (type == TemplateType.constructor) {
      return subject.canGeneratedConstructor(name);
    }

    return subject.canGeneratedMethod(name);
  }
}

/// The template for a method
enum TemplateType {
  /// The template for a method
  method,

  /// The template for a constructor
  constructor,

  /// The template is an overall generator
  none,
}
