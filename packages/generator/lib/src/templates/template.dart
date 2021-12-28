// ignore_for_file: implementation_imports

import 'package:ice/src/domain/domain.dart';
import 'package:ice_annotation/src/methods.dart';
import 'package:meta/meta.dart';

/// The abstraction for a template
abstract class Template {
  /// Creates the template with the [subject]
  const Template(
    this.subject, {
    required this.name,
  });

  /// The template when it wraps sub-templates
  const Template.wrapper(this.subject) : name = IceOptions.wrapper;

  /// adds the template to the [buffer]
  void addToBuffer(StringBuffer buffer) => gate(buffer);

  /// The subject of the template
  final Class subject;

  /// the name of the method/constructor to be generated
  final IceOptions name;

  /// whether the template can be generated
  ///
  /// should be called before [addToBuffer] or [iceToString]
  @mustCallSuper
  bool get canBeGenerated {
    return subject.canGeneratedMethod(name);
  }

  /// checks if the template can be generated
  void gate(StringBuffer buffer, [void Function(StringBuffer)? generator]) {
    if (canBeGenerated) {
      if (generator != null) {
        return generator(buffer);
      }

      return generate(buffer);
    }
  }

  /// generates the template to the [buffer]
  void generate(StringBuffer buffer);

  @override
  String toString() {
    final buffer = StringBuffer();

    generate(buffer);

    return buffer.toString();
  }
}
