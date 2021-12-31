// ignore_for_file: unused_field, public_member_api_docs

import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/ice_templates/ice_class_template.dart';

/// A template to generate methods for
/// - copyWith()
/// - Equatable Props
/// - toString()
class UnionClassTemplate extends IceClassTemplate {
  UnionClassTemplate.forSubject(
    Class subject, {
    required Class? union,
  }) : super.wrapper(subject, union: union);

  @override
  void writeConstructors(StringBuffer buffer) {
    if (subjectIsOfUnion) {
      buffer.writeAll(
        union!.constructors
            .where((c) => c.isGenerative)
            .map<String>((superConst) {
          final constStr = superConst.isConst ? 'const ' : '';
          var superName = superConst.name;
          if (superName.isNotEmpty) {
            superName = '.$superName';
          }
          return '$constStr${subject.genName}${superConst.declaration} '
              ': super$superName(${superConst.args});';
        }),
      );
    } else {
      buffer.write('const ${subject.genName}();');
    }
  }
}
