// ignore_for_file: implementation_imports

import 'package:ice/ice.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/ice_settings.dart';
import 'package:ice_annotation/ice.dart';
import 'package:meta/meta.dart';

part 'template_options.dart';

extension on CopyWith {
  bool get isNone => this == CopyWith.none;
}

/// The abstraction for a template
abstract class Template {
  /// Creates the template with the [subject]
  const Template(
    this.subject, {
    required this.templateType,
  });

  /// The template when it wraps sub-templates
  const Template.wrapper(this.subject) : templateType = TemplateType.wrapper;

  /// adds the template to the [buffer]
  @mustCallSuper
  void addToBuffer(StringBuffer buffer) => gate(buffer);

  /// The subject of the template
  final Class subject;

  /// the name of the method/constructor to be generated
  final TemplateType templateType;

  /// whether the template can be generated
  ///
  /// should be called before [addToBuffer] or [toString]
  @mustCallSuper
  bool get canBeGenerated {
    bool canGenerateJson(bool? Function(IceJsonSerializable) callback,
        bool Function(IceSettings) settingsCallBack) {
      return subject.metaSettings(
        methodCallback: (method) => method.createToJson,
        iceCallback: (ice) {
          final json = ice.jsonSerializable;

          if (json == null) return false;

          if (callback(json) == true) {
            return true;
          }

          return callback(json);
        },
        settingsCallback: (settings) => settingsCallBack(settings),
      );
    }

    /// whether a method can be generated
    ///
    /// returns false if the method already exists
    switch (templateType) {
      case TemplateType.wrapper:
        return true;
      case TemplateType.copyWith:
        if (subject.doNotGenerate.copyWith) return false;

        return subject.metaSettings(
          iceCallback: (ice) => !ice.copyWith.isNone,
          methodCallback: (method) => !method.copyWithType.isNone,
          settingsCallback: (settings) => !settings.copyWith.isNone,
        );
      case TemplateType.equatable:
        if (subject.doNotGenerate.equatable) return false;

        return subject.metaSettings(
          iceCallback: (ice) => ice.equatable,
          methodCallback: (methods) => methods.hasProps,
          settingsCallback: (settings) => settings.equatable,
        );
      case TemplateType.iceToString:
        if (subject.doNotGenerate.tostring) return false;

        return subject.metaSettings(
          iceCallback: (ice) => ice.tostring,
          methodCallback: (methods) => methods.hasToString,
          settingsCallback: (settings) => settings.tostring,
        );
      case TemplateType.toJson:
        return canGenerateJson(
          (json) => json.createToJson,
          (settings) => settings.createToJson,
        );
      case TemplateType.fromJson:
        return canGenerateJson(
          (json) => json.createFactory,
          (settings) => settings.createToJson,
        );
    }
  }

  /// checks if the template can be generated
  void gate(StringBuffer buffer, [void Function(StringBuffer)? generator]) {
    if (!canBeGenerated) {
      return;
    }

    if (generator != null) {
      return generator(buffer);
    }

    return generate(buffer);
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
