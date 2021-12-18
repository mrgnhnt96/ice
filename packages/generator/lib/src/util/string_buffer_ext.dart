// ignore_for_file: parameter_assignments

/// extension to [StringBuffer]
extension StringBufferX on StringBuffer {
  /// accepts a header string to name the section
  ///
  /// wraps the header with brakets
  void writeObject(
    String string, {
    required void Function() body,
    int tab = 0,
    String? open,
    String? close,
    bool appendNewLine = true,
    bool includeSpaceBetweenOpen = true,
  }) {
    final openAndCloseAreNullOrNotNull = (open == null) ^ (close == null);
    if (openAndCloseAreNullOrNotNull) {
      throw ArgumentError(
        'open and close must both be null or both be non-null',
      );
    }

    final opener = open ?? '{';
    final closer = close ?? '}';
    final spacer = includeSpaceBetweenOpen ? ' ' : '';

    writeln('$string$spacer$opener');
    body();
    if (appendNewLine) {
      writeln(closer);
    } else {
      write(closer);
    }
  }

  /// writes a method signature
  void writeMethod(
    String entry, {
    Iterable<String> params = const <String>[],
    required void Function() body,
  }) {
    late final String open, close, seperateWith;

    if (params.isEmpty) {
      open = '(';
      close = ')';
      seperateWith = '';
    } else {
      open = '({';
      close = '})';

      if (params.length >= 3) {
        seperateWith = ',\n';
      } else {
        seperateWith = ', ';
      }
    }

    writeln('$entry $open');
    writeAll(params, seperateWith);
    writeln('$close {');
    body();
    writeln('}');
  }
}
