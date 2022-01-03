// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/ice_templates/ice_class_template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

/// A template to generate methods for
/// - copyWith()
/// - Equatable Props
/// - toString()
class ContainedUnionClassTemplate extends IceClassTemplate {
  ContainedUnionClassTemplate.forSubject(Class subject, Class? union)
      : super.wrapper(subject, union: union);

  @override
  String get classHeader {
    if (subject.annotations.isSubUnion) {
      return 'class ${subject.genName} extends ${union!.name}';
    }

    final hasEquatable = subject.metaSettings(
      methodCallback: (_) => false,
      iceCallback: (settings) => settings.equatable,
      settingsCallback: (settings) => settings.equatable,
    );

    var mixins = 'with ${subject.genName}Mixin';

    if (hasEquatable) {
      mixins += ', EquatableMixin';
    }

    return 'abstract class ${subject.genName} $mixins';
  }

  @override
  void writeConstructors(StringBuffer buffer) {
    if (subject.annotations.isUnionBase) {
      buffer.writepln('const ${subject.genName}();');
      return;
    }

    final params =
        subject.constructors.first.params.formatted(initialize: true);

    buffer.writepln(
      'const ${subject.genName}(${params.join(',')}) : super._();',
    );
  }
}
