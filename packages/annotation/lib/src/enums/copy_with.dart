/// The type of copyWith method that will be generated
enum CopyWith {
  /// NOT `null` safe
  ///
  /// ```dart
  /// myClass.copyWith(field: newValue);
  /// ```
  simple,

  /// 'null' safe
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  anonymous,

  /// 'null' safe
  ///
  /// ```dart
  /// myClass.copyWith(field: newValue);
  /// ```
  nullSafe,

  /// does not generate a copyWith method
  none,
}
