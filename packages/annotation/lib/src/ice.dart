// ignore_for_file: avoid_field_initializers_in_const_classes

import 'package:ice_annotation/src/enums/copy_with_type.dart';
import 'package:meta/meta_meta.dart';

/// {@template ice}
/// Annotation used to mark a class to generate a ice method.
/// {@endtemplate}
@Target({TargetKind.classType})
class Ice {
  /// {@macro ice}
  const Ice({
    this.copyWith,
    this.tostring,
    this.equatable,
    this.copyWithType,
  });

  /// generates the copyWith method
  final bool? copyWith;

  /// generates the `toString` method
  final bool? tostring;

  /// adds `EquatableMixin` and provides prop
  final bool? equatable;

  /// whether the copyWith method is generated
  /// with simple or nullable arguments
  final CopyWithType? copyWithType;
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

/// {@template ice_union_entry_point}
/// the entry point of the union
/// {@endtemplate}
class UnionEntryPoint {
  /// {@macro ice_union_entry_point}
  const UnionEntryPoint();
}

/// {@macro ice_union_entry_point}
const unionEntryPoint = UnionEntryPoint();
