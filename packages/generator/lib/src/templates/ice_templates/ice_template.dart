import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/ice_support.dart';
import 'package:ice/src/templates/ice_templates/union_class_template.dart';
import 'package:ice/src/templates/templates.dart';
import 'package:ice/src/templates/to_json_template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';
import 'package:meta/meta.dart';

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
class IceTemplate extends Template {
  ///
  IceTemplate.wrapper(
    Class subject, {
    this.union,
  }) : super.wrapper(subject);

  ///
  factory IceTemplate.forSubject(
    Class subject, {
    required Class? union,
  }) {
    if (union != null || subject.annotations.isUnionBase) {
      return UnionClassTemplate.forSubject(subject, union: union);
    }

    return IceTemplate.wrapper(subject);
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
  CopyWithTemplate get copyWithTemplate =>
      _copyWithTemplate ??= CopyWithTemplate.forSubject(subject);
  CopyWithTemplate? _copyWithTemplate;

  ///
  String get classHeader => subject.classHeader(union);

  ///
  void constructor(StringBuffer buffer) {
    buffer.writeln('const ${subject.genName}();');
  }

  @override
  void generate(StringBuffer buffer) {
    buffer.writeObject(
      classHeader,
      body: () {
        constructor(buffer);

        writeFields(buffer);

        writeProperties(buffer);
      },
    );

    writeCopyWithSupport();

    writeToJson(buffer);
  }

  ///
  void writeFields(StringBuffer buffer) {
    buffer.writeAll(subject.fieldGetters, '\n');
  }

  ///
  @mustCallSuper
  void writeProperties(StringBuffer buffer) {
    if (generateProperties) {
      copyWithTemplate.addToBuffer(buffer);
      buffer.writeln();

      PropsTemplate.forSubject(
        subject,
        union: union,
        asFunction: false,
      ).addToBuffer(buffer);
      buffer.writeln();

      ToStringTemplate.forSubject(
        subject,
        asFunction: false,
      ).addToBuffer(buffer);
      buffer.writeln();
    }
  }

  ///
  void writeCopyWithSupport() {
    if (generateProperties) {
      IceSupport().add(copyWithTemplate.support);
    }
  }

  ///
  void writeToJson(StringBuffer buffer) {
    final toJsonTemplate = ToJsonTemplate.forSubject(subject);

    if (toJsonTemplate.canBeGenerated) {
      buffer.writeObject(
        'extension _\$${subject.cleanName}X on ${subject.name}',
        body: () {
          toJsonTemplate.addToBuffer(buffer);
        },
      );
    }
  }
}
