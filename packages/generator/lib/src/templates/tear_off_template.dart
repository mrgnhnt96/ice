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

    return super.canBeGenerated;
  }

  @override
  void generate(StringBuffer buffer) {
    final tearOffName = '${subject.genName}Unions';
    buffer.writeObject(
      'class $tearOffName',
      body: () {
        buffer
          ..writeln('const $tearOffName();')
          ..writeln();

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
                  buffer.writeln(defaultCtor.args);
                },
              );
            },
          );
        }
      },
    );
  }
}
