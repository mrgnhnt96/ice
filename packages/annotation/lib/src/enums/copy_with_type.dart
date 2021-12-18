/// The type of copyWith method that will be generated
enum CopyWithType {
  /// If `null` is passed within the `copyWith` method,
  /// the current value will be returned.
  ///
  /// ```dart
  /// myClass.copyWith(field: newValue);
  /// ```
  simple,

  /// if `null` is passed within the `copyWith` method,
  /// `null` will be returned.
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  typeSafe,
}
