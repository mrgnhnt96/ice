// ignore_for_file: implementation_imports

import 'package:ice/ice.dart';
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
    /// whether a method can be generated
    ///
    /// returns false if the method already exists
    switch (name) {
      case IceOptions.wrapper:
        return true;
      case IceOptions.copyWith:
        return subject.metaSettings(
          iceCallback: (ice) => ice.copyWith,
          methodCallback: (method) => method.hasCopyWith,
          settingsCallback: (settings) => settings.copyWith,
        );
      case IceOptions.equatable:
        return subject.metaSettings(
          iceCallback: (ice) => ice.equatable,
          methodCallback: (methods) => methods.hasProps,
          settingsCallback: (settings) => settings.equatable,
        );
      case IceOptions.iceToString:
        return subject.metaSettings(
          iceCallback: (ice) => ice.iceToString,
          methodCallback: (methods) => methods.hasToString,
          settingsCallback: (settings) => settings.iceToString,
        );
      case IceOptions.toJson:
      case IceOptions.fromJson:
        final annotations = subject.annotations;
        if (annotations.isIceAnnotation) {
          final json = annotations.ice!.jsonSerializable;
          if (json == null) {
            return false;
          }

          if (name.isFromJson) {
            return json.createFactory ?? true;
          }

          return json.createToJson ?? true;
        } else if (annotations.isMethodAnnotation) {
          final methods = annotations.methods!;
          if (name.isFromJson) {
            return methods.createFromJson;
          }

          return methods.createToJson;
        }

        if (name.isFromJson) {
          return iceSettings.jsonSerializable.createFactory;
        }

        return iceSettings.jsonSerializable.createToJson;
    }
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
