import 'package:meta/meta_meta.dart';

/// {@template ice}
/// Annotation used to mark a class to generate a ice method.
/// {@endtemplate}
@Target({TargetKind.classType})
class Ice {
  /// {@macro ice}
  const Ice({
    this.isPrivate = false,
  });

  /// whether the class is private
  final bool isPrivate;
}

/// {@macro ice}
const ice = Ice();

/*
TODO: check this out
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

/// {@macro ice}
///
/// The output class name will be remain private.
const privateIce = Ice(isPrivate: true);

/// {@template ice}
/// Annotation used to mark a class to generate a ice method.
/// {@endtemplate}
@Target({TargetKind.classType})
class IceUnion extends Ice {
  /// {@macro ice}
  const IceUnion(this.union) : super();

  /// {@macro ice}
  const IceUnion.private(this.union) : super(isPrivate: true);

  /// the type of the top union class
  final Type union;
}
