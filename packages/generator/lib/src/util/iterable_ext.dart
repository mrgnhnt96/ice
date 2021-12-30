///
extension IterableX<T> on Iterable<T> {
  ///
  T? firstWhereOrNull(bool Function(T) predicate) {
    for (final element in this) {
      if (predicate(element)) {
        return element;
      }
    }

    return null;
  }
}
