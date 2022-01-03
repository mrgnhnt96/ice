import 'package:ice/src/domain/class.dart';
import 'package:ice/src/templates/templates.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on Class {}

///
class TearOffTemplate extends Template {
  ///
  const TearOffTemplate.forSubject(
    Class subject,
    this.unions,
  ) : super.wrapper(subject);

  /// the unions that will be used to generate the tear off
  final List<Class> unions;

  @override
  bool get canBeGenerated {
    if (unions.isEmpty) {
      return false;
    }

    if (subject.annotations.isContainedUnion) {
      return false;
    }

    return super.canBeGenerated;
  }

  @override
  void generate(StringBuffer buffer) {
    final tearOffName = '${subject.genName}TearOffs';
    buffer.writeObject(
      'class $tearOffName',
      body: () {
        buffer.writepln('const $tearOffName();');

        for (final union in unions) {
          final defaultCtor = union.constructorWhere();
          if (defaultCtor == null) {
            continue;
          }

          buffer.writeObject(
            '${subject.name} ${union.nameAsArg}${defaultCtor.declaration}',
            body: () {
              buffer.writeObject(
                'return ${union.name}',
                open: '(',
                close: ');',
                body: () {
                  buffer.write(defaultCtor.args);
                },
              );
            },
          );
        }
      },
    );
  }
}
