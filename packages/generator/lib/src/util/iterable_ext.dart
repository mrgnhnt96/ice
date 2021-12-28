///
extension IterableX on Iterable {
  ///
  T? firstWhereOrNull<T>(bool Function(T) predicate) {
    for (final element in this) {
      if (predicate(element as T)) {
        return element;
      }
    }

    return null;
  }
}
