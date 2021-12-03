import 'package:meta/meta_meta.dart';

/// {@template ice}
/// Annotation used to mark a class to generate a ice method.
/// {@endtemplate}
@Target({TargetKind.classType})
class Ice {
  /// {@macro ice}
  const Ice() : isPrivate = false;

  /// {@macro ice}
  ///
  /// creates a private class instance
  const Ice.private() : isPrivate = true;

  /// {@macro ice_union}
  const factory Ice.union(Type type) = IceUnion;

  /// {@macro ice_union}
  ///
  /// create a private class instance
  const factory Ice.privateUnion(Type type) = IceUnion.private;

  /// whether the class is private
  final bool isPrivate;
}

/*
TODO: check for `$` on private classes
? If it is private, then the base class super be "super private"
```
class _$Example {}
! generated
class _Example extends _$Example {}
```
? If private is "super private", then should we always use "super private"?
? maybe it could be a way that its taught, but under the hood,
? it will accept both
*/

/// {@template ice_union}
/// Annotation used to mark a class to generate a ice method.
/// {@endtemplate}
@Target({TargetKind.classType})
class IceUnion extends Ice {
  /// {@macro ice}
  const IceUnion(this.union) : super();

  /// {@macro ice}
  const IceUnion.private(this.union) : super.private();

  /// the type of the top union class
  final Type union;
}

/// {@template ice_union_base}
/// the base of the union
///  {@endtemplate}
class IceUnionBase {
  /// {@macro ice_union_base}
  const IceUnionBase() : isPrivate = false;

  /// {@macro ice_union_base}
  const IceUnionBase.private() : isPrivate = true;

  /// whether the class is private
  final bool isPrivate;
}
