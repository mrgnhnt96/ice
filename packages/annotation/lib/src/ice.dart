// ignore_for_file: avoid_field_initializers_in_const_classes

import 'package:ice_annotation/src/enums/copy_with_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta_meta.dart';

export 'package:json_annotation/json_annotation.dart';

/// {@template ice}
/// Annotation used to mark a class to generate a ice method.
/// {@endtemplate}
@Target({TargetKind.classType})
class Ice {
  /// {@macro ice}
  const Ice({
    this.copyWith,
    this.copyWithType,
    this.equatable,
    this.ignoreGettersAsProps,
    this.iceToString,
    this.jsonSerializable = const JsonSerializable(),
  });

  /// generates the copyWith method
  final bool? copyWith;

  /// whether the copyWith method is generated
  /// with simple or nullable arguments
  final CopyWithType? copyWithType;

  /// adds `EquatableMixin` and provides prop
  final bool? equatable;

  /// whether to ignore getter methods as fields
  /// to be included in `Equatable`'s props list
  ///
  /// Does nothing if [equatable] is `false`
  final bool? ignoreGettersAsProps;

  /// generates the `iceToString` method
  final bool? iceToString;

  /// generates the serializable methods
  final JsonSerializable? jsonSerializable;
}

/// {@template ice_union_base}
/// the base of the union
///  {@endtemplate}
@Target({TargetKind.classType})
class IceUnion implements Ice {
  /// {@macro ice_union_base}
  const IceUnion.of(
    this.base, {
    this.copyWith,
    this.copyWithType,
    this.equatable,
    this.iceToString,
    this.ignoreGettersAsProps,
    this.jsonSerializable = const JsonSerializable(),
  });

  /// the base of the union
  final Type base;

  /// {@macro ice_union_base}
  // ignore: prefer_constructors_over_static_methods
  static const IceUnion create = IceUnion.of(IceUnion);

  @override
  final bool? copyWith;

  @override
  final CopyWithType? copyWithType;

  @override
  final bool? equatable;

  @override
  final bool? iceToString;

  @override
  final bool? ignoreGettersAsProps;

  @override
  final JsonSerializable? jsonSerializable;
}
