/// Ice annotations for constructors
class IceConstructor {
  const IceConstructor._();

  /// dedicates this constructor to be used when
  /// generating the `fromJson` method
  static const fromJson = IceConstructor._();

  /// dedicates this constructor to be used when
  /// generating the `copyWith` method
  static const copyWith = IceConstructor._();
}
