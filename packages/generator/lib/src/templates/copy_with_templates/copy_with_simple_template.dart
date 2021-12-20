import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_extensions.dart';
import 'package:ice/src/templates/copy_with_templates/copy_with_template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';
import 'package:ice_annotation/ice.dart';

extension on Param {
  String forConstructor() {
    return '$nullableType $name';
  }

  String asArgument() {
    return '$name: $name ?? this.$name';
  }
}

/// {@template copy_with_method}
/// Generates a copyWith method for a class.
/// {@endtemplate}
class CopyWithSimpleTemplate extends CopyWithTemplate {
  /// {@macro copy_with_method}
  CopyWithSimpleTemplate.forSubject(Class subject)
      : super(
          subject,
          type: CopyWithType.simple,
        );

  @override
  void generate(StringBuffer buffer) {
    final args = constructor.arguments((p) => p.asArgument());
    buffer.writeMethod(
      subject.copyWithHeader,
      params: constructor.parameters((p) => p.forConstructor()),
      body: () {
        buffer.writeObject(
          'return ${constructor.displayName}',
          open: '(',
          includeSpaceBetweenOpen: false,
          body: () => buffer.writeAll(args, ',\n'),
          close: '${args.length >= 3 ? ',' : ''});',
        );
      },
    );
  }

  @override
  void support(StringBuffer buffer) {}
}
