// ignore_for_file: parameter_assignments

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

    write('$string$opener');
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
      seperateWith = ',';
      beforeClose = ',';
      open = '({';
      close = '})';
    }

    write('$entry $open');
    writeAll(params, seperateWith);
    write('$beforeClose$close {');
    body();
    write('}');
  }
}
