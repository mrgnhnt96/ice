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
  const Ice._()
      : union = const IceUnion(),
        createUnion = const IceUnionBase();

  ///{@macro ice_union}
  final IceUnion union;

  /// {@macro ice_union_base}
  final IceUnionBase createUnion;
}

/// {@template ice_union}
/// Annotation used to mark a class to generate a ice method.
/// {@endtemplate}
@Target({TargetKind.classType})
class IceUnion extends Ice {
  /// {@macro ice}
  const IceUnion() : super._();
}

/// {@template ice_union_base}
/// the base of the union
///  {@endtemplate}
@Target({TargetKind.classType})
class IceUnionBase {
  /// {@macro ice_union_base}
  const IceUnionBase();
}
