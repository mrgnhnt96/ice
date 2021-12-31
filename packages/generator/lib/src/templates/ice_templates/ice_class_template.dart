import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/ice_support.dart';
import 'package:ice/src/templates/from_json_template.dart';
import 'package:ice/src/templates/ice_templates/union_class_template.dart';
import 'package:ice/src/templates/templates.dart';
import 'package:ice/src/templates/to_json_template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';
import 'package:ice_annotation/ice.dart'
    show IceJsonSerializable, JsonSerializable;
import 'package:meta/meta.dart';

extension on IceJsonSerializable {
  /// converts all values to the json_serializable annotation
  String get asAnnotation {
    // ignore: deprecated_member_use
    final defaults = JsonSerializable.defaults;

    final allArgs = [
      if (createFactory ?? true)
        "constructor: r'${FromJsonTemplate.fromJsonAccessor}'",
      if (createToJson != null && createToJson != defaults.createToJson)
        'createToJson: $createToJson',
      if (createFactory != null && createFactory != defaults.createFactory)
        'createFactory: $createFactory',
      if (explicitToJson != null && explicitToJson != defaults.explicitToJson)
        'explicitToJson: $explicitToJson',
      if (fieldRename != null && fieldRename != defaults.fieldRename)
        'fieldRename: $fieldRename',
      if (anyMap != null && anyMap != defaults.anyMap) 'anyMap: $anyMap',
      if (this.checked != null && this.checked != defaults.checked)
        'checked: ${this.checked}',
      if (disallowUnrecognizedKeys != null &&
          disallowUnrecognizedKeys != defaults.disallowUnrecognizedKeys)
        'disallowUnrecognizedKeys: $disallowUnrecognizedKeys',
      if (ignoreUnannotated != null &&
          ignoreUnannotated != defaults.ignoreUnannotated)
        'ignoreUnannotated: $ignoreUnannotated',
      if (includeIfNull != null && includeIfNull != defaults.includeIfNull)
        'includeIfNull: $includeIfNull',
    ];

    var args = '';

    if (allArgs.isNotEmpty) {
      args += '${allArgs.join(', ')},';
    }

    return '@JsonSerializable($args)';
  }
}

extension on Class {
  String classHeader([Class? union]) {
    if (union != null) {
      if (!annotations.isUnionBase) {
        return 'abstract class $genName extends ${union.name}';
      }

      return union.classHeader();
    }

    final hasEquatable = metaSettings(
      methodCallback: (_) => false,
      iceCallback: (settings) => settings.equatable,
      settingsCallback: (settings) => settings.equatable,
    );
    var mixins = '';
    var implements = '';

    if (hasEquatable) {
      mixins = ' with EquatableMixin';
    }

    if (annotations.isUnionBase) {
      implements = ' implements $unionBase';
      final unionMixin = '_\$${cleanName}Mixin';
      mixins = '$mixins, $unionMixin';
    }

    return 'abstract class $genName$mixins$implements';
  }
}

///
class IceClassTemplate extends Template {
  ///
  IceClassTemplate.wrapper(
    Class subject, {
    this.union,
  }) : super.wrapper(subject);

  ///
  factory IceClassTemplate.forSubject(
    Class subject, {
    required Class? union,
  }) {
    if (union != null || subject.annotations.isUnionBase) {
      return UnionClassTemplate.forSubject(subject, union: union);
    }

    return IceClassTemplate.wrapper(subject);
  }

  ///
  final Class? union;

  ///
  bool get subjectIsOfUnion => union != null;

  ///
  bool get subjectIsUnionBase => subject.annotations.isUnionBase;

  ///
  bool get generateProperties =>
      subject.annotations.ice != null || subjectIsUnionBase;

  ///
  String get classHeader => subject.classHeader(union);

  ///
  void writeConstructors(StringBuffer buffer) {
    buffer.writeln('const ${subject.genName}();');
  }

  ///
  void jsonSerializableAnnotation(StringBuffer buffer) {
    final iceJsonSerializable = subject.annotations.ice?.jsonSerializable;

    if (iceJsonSerializable == null) {
      return;
    }

    buffer.writeln(iceJsonSerializable.asAnnotation);
  }

  @override
  void generate(StringBuffer buffer) {
    final fromJsonTemplate = FromJsonTemplate.forSubject(subject);

    jsonSerializableAnnotation(buffer);
    buffer
      ..writeObject(
        classHeader,
        body: () {
          writeConstructors(buffer);

          fromJsonTemplate.writeConstructors(buffer);

          buffer.writeln();
          writeFields(buffer);

          buffer.writeln();
          writeProperties(buffer);

          buffer.writeln();
          ToJsonTemplate.forSubject(subject, union).addToBuffer(buffer);
        },
      )
      ..writeln();

    fromJsonTemplate.addToBuffer(buffer);
  }

  ///
  void writeFields(StringBuffer buffer) {
    buffer.writeAll(subject.fieldGetters, '\n');
  }

  ///
  @mustCallSuper
  void writeProperties(StringBuffer buffer) {
    if (generateProperties) {
      final copyWithTemplate = CopyWithTemplate.forSubject(subject);
      if (copyWithTemplate != null) {
        copyWithTemplate.addToBuffer(buffer);
        IceSupport().add(copyWithTemplate.support);
        buffer.writeln();
      }

      PropsTemplate.forSubject(
        subject,
        union: union,
        asExtension: false,
      ).addToBuffer(buffer);
      buffer.writeln();

      ToStringTemplate.forSubject(
        subject,
        asExtension: false,
      ).addToBuffer(buffer);
      buffer.writeln();
    }
  }
}