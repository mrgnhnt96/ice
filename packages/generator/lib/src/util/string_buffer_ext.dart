// ignore_for_file: parameter_assignments

import 'dart:math';

/// {@template tab_indentation}
/// writes new line with tab indentation
/// {@endtemplate}
String tab(String s, [int n = 1]) {
  n = max(n, 0);

  return '${tabIndentation * n}$s';
}

/// The tab indentation string.
const tabIndentation = '  ';

/// extension to [StringBuffer]
extension StringBufferX on StringBuffer {
  /// {@macro tab_indentation}
  void writelnTab(String s, [int n = 1]) {
    writeln(tab(s, n));
  }

  /// {@macro tab_indentation}
  void writeTab(String s, [int n = 1]) {
    write(tab(s, n));
  }

  /// accepts a header string to name the section
  ///
  /// wraps the header with brakets
  void writeObject(
    String string, {
    required void Function(StringBuffer, int) body,
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

    writelnTab('$string$spacer$opener', tab);
    body(this, tab + 1);
    if (appendNewLine) {
      writelnTab(closer, tab);
    } else {
      writeTab(closer, tab);
    }
  }
}
