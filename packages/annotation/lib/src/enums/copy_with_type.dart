/// The type of copyWith method that will be generated
enum CopyWithType {
  /// follows convention of
  ///
  /// ```dart
  /// myClass.copyWith(field: newValue);
  /// ```
  simple,

  /// follows convention of
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  nullable,
}
