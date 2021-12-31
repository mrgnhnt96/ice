// ignore_for_file: avoid_field_initializers_in_const_classes, overridden_fields
// ignore_for_file: prefer_initializing_formals

import 'package:ice_annotation/src/enums/copy_with.dart';
import 'package:ice_annotation/src/ice_json_serializable.dart';
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
    this.equatable,
    this.ignoreGettersAsProps,
    bool? toString,
    this.jsonSerializable = const IceJsonSerializable(),
  })  : props = equatable,
        tostring = toString;

  ///
  const Ice.only({
    this.props = false,
    bool toString = false,
    this.copyWith,
  })  : tostring = toString,
        equatable = false,
        ignoreGettersAsProps = false,
        jsonSerializable = null;

  /// whether the copyWith method is generated
  /// with simple or nullable arguments
  final CopyWith? copyWith;

  /// adds `EquatableMixin`, includes [props]
  final bool? equatable;

  /// whether to ignore getter methods as fields
  /// to be included in `Equatable`'s props list
  ///
  /// Does nothing if [equatable] is `false`
  final bool? ignoreGettersAsProps;

  /// generates the serializable methods
  final IceJsonSerializable? jsonSerializable;

  /// whether to generate the props method
  final bool? props;

  /// whether to generate the `toString` method
  final bool? tostring;
}

/// {@template ice_union_base}
/// the base of the union
/// {@endtemplate}
@Target({TargetKind.classType})
class IceUnion extends Ice {
  /// {@macro ice_union_base}
  const IceUnion.of(
    this.base, {
    this.unionTypeId,
    CopyWith? copyWith,
    bool? equatable,
    bool? toString,
    bool? ignoreGettersAsProps,
    IceJsonSerializable? jsonSerializable = const IceJsonSerializable(),
  })  : unionTypeKey = '',
        super(
          copyWith: copyWith,
          equatable: equatable,
          toString: toString,
          ignoreGettersAsProps: ignoreGettersAsProps,
          jsonSerializable: jsonSerializable,
        );

  /// {@macro ice_union_base}
  const IceUnion.create({
    this.unionTypeKey,
    CopyWith? copyWith,
    bool? equatable,
    bool? toString,
    bool? ignoreGettersAsProps,
    IceJsonSerializable? jsonSerializable = const IceJsonSerializable(),
  })  : base = IceUnion,
        unionTypeId = '',
        super(
          copyWith: copyWith,
          equatable: equatable,
          toString: toString,
          ignoreGettersAsProps: ignoreGettersAsProps,
          jsonSerializable: jsonSerializable,
        );

  /// the base of the union
  final Type base;

  /// the key used to identify the union during serialization
  ///
  /// ```dart
  /// {
  ///   unionTypeKey: unionTypeId
  /// }
  /// ```
  ///
  /// default: `$unionType`
  final String? unionTypeKey;

  /// the id used as the union type during serialization
  ///
  /// ```dart
  /// {
  ///   unionTypeKey: unionTypeId
  /// }
  /// ```
  /// defaults to the class name
  final String? unionTypeId;
}
