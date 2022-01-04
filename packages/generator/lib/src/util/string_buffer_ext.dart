// ignore_for_file: parameter_assignments

import 'package:ice/ice.dart';

/// extension to [StringBuffer]
extension StringBufferX on StringBuffer {
  /// accepts a header string to name the section
  ///
  /// wraps the header with brakets
  void writeObject(
    String string, {
    required void Function() body,
    String? open,
    String? close,
  }) {
    final openAndCloseAreNullOrNotNull = (open == null) ^ (close == null);
    if (openAndCloseAreNullOrNotNull) {
      throw ArgumentError(
        'open and close must both be null or both be non-null',
      );
    }

    final opener = open ?? '{';
    final closer = close ?? '}';

    writepln('$string$opener');
    body();
    write(closer);
  }

  /// writes a method signature
  void writeMethod(
    String entry, {
    Iterable<String> params = const <String>[],
    required void Function() body,
  }) {
    late final String open, close, seperateWith, beforeClose;
    params = params.where((e) => e.isNotEmpty);

    if (params.isEmpty) {
      open = '(';
      close = ')';
      seperateWith = '';
      beforeClose = '';
    } else {
      seperateWith = ',$pln';
      beforeClose = ',';
      open = '({';
      close = '})';
    }

    writepln('$entry$open');
    writeAll(params, seperateWith);
    writepln('$beforeClose$close {');
    body();
    writepln('}');
  }

  /// writes a _possible_ line break
  /// if [_LINE_BREAK] is true
  void writepln([Object? object = '']) {
    if (_LINE_BREAK) {
      writeln(object);
    } else {
      write(object);
    }
  }
}

/// DEV PURPOSES ONLY
/// adds line break to make output easier to debug
String get pln => _LINE_BREAK ? '\n' : '';

// ignore: non_constant_identifier_names
bool get _LINE_BREAK => iceSettings.debugOutput;
