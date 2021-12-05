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

  /// {@macro ice_union_base}
  static const IceUnionBase createUnion = IceUnionBase();
}

/// {@template ice_union_base}
/// the base of the union
///  {@endtemplate}
@Target({TargetKind.classType})
class IceUnionBase {
  /// {@macro ice_union_base}
  const IceUnionBase();
}
