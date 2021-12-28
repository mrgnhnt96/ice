import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/ice_support.dart';
import 'package:ice/src/templates/from_json_template.dart';
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

  Constructor get fromJsonConstructor {
    Constructor? defaultCtor;
    for (final ctor in constructors) {
      if (ctor.isJsonConstructor) {
        return ctor;
      }

      if (ctor.isDefault) {
        defaultCtor = ctor;
      }
    }

    return defaultCtor ?? constructors.first;
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
  String get classHeader => subject.classHeader(union);

  ///
  void writeConstructors(StringBuffer buffer) {
    buffer.writeln('const ${subject.genName}();');
  }

  /// generates the constructor that json_serializable uses
  void fromJsonAccessConstructor(StringBuffer buffer) {
    final iceJsonSerializable = subject.annotations.ice?.jsonSerializable;

    if (iceJsonSerializable == null) {
      return;
    }

    if (!(iceJsonSerializable.createFactory ?? true)) {
      return;
    }

    final constructor = subject.fromJsonConstructor;
    final constStr = constructor.isConst ? 'const ' : '';

    buffer
      ..writeObject(
        '${constStr}factory ${subject.genName}._',
        open: '(',
        close: ')',
        body: () {
          buffer.writeAll(constructor.params.formatted(), ',');
        },
      )
      ..writeln('= ${constructor.displayName};');
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
          fromJsonAccessConstructor(buffer);
          fromJsonTemplate.writeConstructor(buffer);

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
