// ignore_for_file: avoid_field_initializers_in_const_classes

import 'package:meta/meta_meta.dart';

/// {@macro ice}
const ice = Ice._();

/// {@template ice}
/// Annotation used to mark a class to generate a ice method.
/// {@endtemplate}
@Target({TargetKind.classType})
class Ice {
  /// {@macro ice}
  const Ice._();
}

/// {@template ice_union_base}
/// the base of the union
///  {@endtemplate}
@Target({TargetKind.classType})
class IceUnion {
  /// {@macro ice_union_base}
  const IceUnion.of(this.base);

  /// the base of the union
  final Type base;

  /// {@macro ice_union_base}
  // ignore: prefer_constructors_over_static_methods
  static const IceUnion create = IceUnion.of(IceUnion);
}
