import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

class ToStringTemplate {
  const ToStringTemplate.forSubject(Class subject) : _subject = subject;

  final Class _subject;

  @override
  String toString() {
    final buffer = StringBuffer();

    return buffer.toString();
  }
}
