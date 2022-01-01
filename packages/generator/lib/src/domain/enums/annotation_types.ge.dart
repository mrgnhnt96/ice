// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: constant_identifier_names,prefer_const_declarations,unused_local_variable,prefer_int_literals,lines_longer_than_80_chars,prefer_const_constructors

part of 'annotation_types.dart';

/// Extensions for the enum ClassAnnotationTypes
extension ClassAnnotationTypesX on ClassAnnotationTypes {
  /// Map of all values of the enum
  T map<T extends Object?>({
    required T ice,
    required T jsonSerializable,
    required T unionCreate,
    required T unionOf,
    required T only,
    required T contained,
  }) {
    switch (this) {
      case ClassAnnotationTypes.ice:
        return ice;
      case ClassAnnotationTypes.jsonSerializable:
        return jsonSerializable;
      case ClassAnnotationTypes.unionCreate:
        return unionCreate;
      case ClassAnnotationTypes.unionOf:
        return unionOf;
      case ClassAnnotationTypes.only:
        return only;
      case ClassAnnotationTypes.contained:
        return contained;
    }
  }

  /// Optionally map all values of the enum
  ///
  /// default value is provided when value has not been mapped
  T maybeMap<T extends Object?>({
    required T orElse,
    T? ice,
    T? jsonSerializable,
    T? unionCreate,
    T? unionOf,
    T? only,
    T? contained,
  }) {
    var isNullable = true;
    try {
      final value = null as T;
    } catch (_) {
      isNullable = false;
    }

    switch (this) {
      case ClassAnnotationTypes.ice:
        if (ice == null && !isNullable) return orElse;
        return ice as T;
      case ClassAnnotationTypes.jsonSerializable:
        if (jsonSerializable == null && !isNullable) return orElse;
        return jsonSerializable as T;
      case ClassAnnotationTypes.unionCreate:
        if (unionCreate == null && !isNullable) return orElse;
        return unionCreate as T;
      case ClassAnnotationTypes.unionOf:
        if (unionOf == null && !isNullable) return orElse;
        return unionOf as T;
      case ClassAnnotationTypes.only:
        if (only == null && !isNullable) return orElse;
        return only as T;
      case ClassAnnotationTypes.contained:
        if (contained == null && !isNullable) return orElse;
        return contained as T;
    }
  }

  /// Returns the serialized value of the enum field.
  Object get serialized {
    return map<Object>(
      ice: ClassAnnotationTypesConv._iceName,
      jsonSerializable: ClassAnnotationTypesConv._jsonSerializableName,
      unionCreate: ClassAnnotationTypesConv._unionCreateName,
      unionOf: ClassAnnotationTypesConv._unionOfName,
      only: ClassAnnotationTypesConv._onlyName,
      contained: ClassAnnotationTypesConv._containedName,
    );
  }
}

/// {@template class_annotation_types.json_converter}
/// Serializes [ClassAnnotationTypes] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @ClassAnnotationTypesConv()
/// final ClassAnnotationTypes myEnum;
/// ```
/// {@endtemplate}
class ClassAnnotationTypesConv
    extends JsonConverter<ClassAnnotationTypes, Object> {
  /// {@macro class_annotation_types.json_converter}
  const ClassAnnotationTypesConv({this.defaultValue});

  /// the value to be used when no match is found
  final ClassAnnotationTypes? defaultValue;

  /// {@macro class_annotation_types.json_converter_nullable}
  static const nullable = _ClassAnnotationTypesNullableConv();

  static const _iceName = 'Ice';
  static const _jsonSerializableName = 'JsonSerializable';
  static const _unionCreateName = 'IceUnion.create';
  static const _unionOfName = 'IceUnion.of';
  static const _onlyName = 'Ice.only';
  static const _containedName = 'IceUnion.contained';

  @override
  ClassAnnotationTypes fromJson(Object json) {
    switch (json) {
      case _iceName:
        return ClassAnnotationTypes.ice;
      case _jsonSerializableName:
        return ClassAnnotationTypes.jsonSerializable;
      case _unionCreateName:
        return ClassAnnotationTypes.unionCreate;
      case _unionOfName:
        return ClassAnnotationTypes.unionOf;
      case _onlyName:
        return ClassAnnotationTypes.only;
      case _containedName:
        return ClassAnnotationTypes.contained;
      default:
        if (defaultValue != null) return defaultValue!;

        throw Exception('Unknown field: $json');
    }
  }

  @override
  Object toJson(ClassAnnotationTypes object) => object.serialized;
}

/// {@template class_annotation_types.json_converter_nullable}
/// Serializes [ClassAnnotationTypes?] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @ClassAnnotationTypesConv.nullable
/// final ClassAnnotationTypes? myEnum;
/// ```
/// {@endtemplate}
class _ClassAnnotationTypesNullableConv
    extends JsonConverter<ClassAnnotationTypes?, Object?> {
  /// {@macro class_annotation_types.json_converter}
  const _ClassAnnotationTypesNullableConv();

  @override
  ClassAnnotationTypes? fromJson(Object? json) {
    switch (json) {
      case ClassAnnotationTypesConv._iceName:
        return ClassAnnotationTypes.ice;
      case ClassAnnotationTypesConv._jsonSerializableName:
        return ClassAnnotationTypes.jsonSerializable;
      case ClassAnnotationTypesConv._unionCreateName:
        return ClassAnnotationTypes.unionCreate;
      case ClassAnnotationTypesConv._unionOfName:
        return ClassAnnotationTypes.unionOf;
      case ClassAnnotationTypesConv._onlyName:
        return ClassAnnotationTypes.only;
      case ClassAnnotationTypesConv._containedName:
        return ClassAnnotationTypes.contained;
      default:
        return null;
    }
  }

  @override
  Object? toJson(ClassAnnotationTypes? object) => object?.serialized;
}

/// Extensions for the enum CtorAnnotationTypes
extension CtorAnnotationTypesX on CtorAnnotationTypes {
  /// Map of all values of the enum
  T map<T extends Object?>({
    required T copyWith,
    required T fromJson,
  }) {
    switch (this) {
      case CtorAnnotationTypes.copyWith:
        return copyWith;
      case CtorAnnotationTypes.fromJson:
        return fromJson;
    }
  }

  /// Optionally map all values of the enum
  ///
  /// default value is provided when value has not been mapped
  T maybeMap<T extends Object?>({
    required T orElse,
    T? copyWith,
    T? fromJson,
  }) {
    var isNullable = true;
    try {
      final value = null as T;
    } catch (_) {
      isNullable = false;
    }

    switch (this) {
      case CtorAnnotationTypes.copyWith:
        if (copyWith == null && !isNullable) return orElse;
        return copyWith as T;
      case CtorAnnotationTypes.fromJson:
        if (fromJson == null && !isNullable) return orElse;
        return fromJson as T;
    }
  }

  /// Returns the serialized value of the enum field.
  Object get serialized {
    return map<Object>(
      copyWith: CtorAnnotationTypesConv._copyWithName,
      fromJson: CtorAnnotationTypesConv._fromJsonName,
    );
  }
}

/// {@template ctor_annotation_types.json_converter}
/// Serializes [CtorAnnotationTypes] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @CtorAnnotationTypesConv()
/// final CtorAnnotationTypes myEnum;
/// ```
/// {@endtemplate}
class CtorAnnotationTypesConv
    extends JsonConverter<CtorAnnotationTypes, Object> {
  /// {@macro ctor_annotation_types.json_converter}
  const CtorAnnotationTypesConv({this.defaultValue});

  /// the value to be used when no match is found
  final CtorAnnotationTypes? defaultValue;

  /// {@macro ctor_annotation_types.json_converter_nullable}
  static const nullable = _CtorAnnotationTypesNullableConv();

  static const _copyWithName = 'IceConstructor.copyWith';
  static const _fromJsonName = 'IceConstructor.fromJson';

  @override
  CtorAnnotationTypes fromJson(Object json) {
    switch (json) {
      case _copyWithName:
        return CtorAnnotationTypes.copyWith;
      case _fromJsonName:
        return CtorAnnotationTypes.fromJson;
      default:
        if (defaultValue != null) return defaultValue!;

        throw Exception('Unknown field: $json');
    }
  }

  @override
  Object toJson(CtorAnnotationTypes object) => object.serialized;
}

/// {@template ctor_annotation_types.json_converter_nullable}
/// Serializes [CtorAnnotationTypes?] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @CtorAnnotationTypesConv.nullable
/// final CtorAnnotationTypes? myEnum;
/// ```
/// {@endtemplate}
class _CtorAnnotationTypesNullableConv
    extends JsonConverter<CtorAnnotationTypes?, Object?> {
  /// {@macro ctor_annotation_types.json_converter}
  const _CtorAnnotationTypesNullableConv();

  @override
  CtorAnnotationTypes? fromJson(Object? json) {
    switch (json) {
      case CtorAnnotationTypesConv._copyWithName:
        return CtorAnnotationTypes.copyWith;
      case CtorAnnotationTypesConv._fromJsonName:
        return CtorAnnotationTypes.fromJson;
      default:
        return null;
    }
  }

  @override
  Object? toJson(CtorAnnotationTypes? object) => object?.serialized;
}

/// Extensions for the enum FieldAnnotationTypes
extension FieldAnnotationTypesX on FieldAnnotationTypes {
  /// Map of all values of the enum
  T map<T extends Object?>({
    required T jsonKey,
    required T ignoreProp,
  }) {
    switch (this) {
      case FieldAnnotationTypes.jsonKey:
        return jsonKey;
      case FieldAnnotationTypes.ignoreProp:
        return ignoreProp;
    }
  }

  /// Optionally map all values of the enum
  ///
  /// default value is provided when value has not been mapped
  T maybeMap<T extends Object?>({
    required T orElse,
    T? jsonKey,
    T? ignoreProp,
  }) {
    var isNullable = true;
    try {
      final value = null as T;
    } catch (_) {
      isNullable = false;
    }

    switch (this) {
      case FieldAnnotationTypes.jsonKey:
        if (jsonKey == null && !isNullable) return orElse;
        return jsonKey as T;
      case FieldAnnotationTypes.ignoreProp:
        if (ignoreProp == null && !isNullable) return orElse;
        return ignoreProp as T;
    }
  }

  /// Returns the serialized value of the enum field.
  Object get serialized {
    return map<Object>(
      jsonKey: FieldAnnotationTypesConv._jsonKeyName,
      ignoreProp: FieldAnnotationTypesConv._ignorePropName,
    );
  }
}

/// {@template field_annotation_types.json_converter}
/// Serializes [FieldAnnotationTypes] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @FieldAnnotationTypesConv()
/// final FieldAnnotationTypes myEnum;
/// ```
/// {@endtemplate}
class FieldAnnotationTypesConv
    extends JsonConverter<FieldAnnotationTypes, Object> {
  /// {@macro field_annotation_types.json_converter}
  const FieldAnnotationTypesConv({this.defaultValue});

  /// the value to be used when no match is found
  final FieldAnnotationTypes? defaultValue;

  /// {@macro field_annotation_types.json_converter_nullable}
  static const nullable = _FieldAnnotationTypesNullableConv();

  static const _jsonKeyName = 'IceField.jsonKey';
  static const _ignorePropName = 'IceField.ignoreProp';

  @override
  FieldAnnotationTypes fromJson(Object json) {
    switch (json) {
      case _jsonKeyName:
        return FieldAnnotationTypes.jsonKey;
      case _ignorePropName:
        return FieldAnnotationTypes.ignoreProp;
      default:
        if (defaultValue != null) return defaultValue!;

        throw Exception('Unknown field: $json');
    }
  }

  @override
  Object toJson(FieldAnnotationTypes object) => object.serialized;
}

/// {@template field_annotation_types.json_converter_nullable}
/// Serializes [FieldAnnotationTypes?] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @FieldAnnotationTypesConv.nullable
/// final FieldAnnotationTypes? myEnum;
/// ```
/// {@endtemplate}
class _FieldAnnotationTypesNullableConv
    extends JsonConverter<FieldAnnotationTypes?, Object?> {
  /// {@macro field_annotation_types.json_converter}
  const _FieldAnnotationTypesNullableConv();

  @override
  FieldAnnotationTypes? fromJson(Object? json) {
    switch (json) {
      case FieldAnnotationTypesConv._jsonKeyName:
        return FieldAnnotationTypes.jsonKey;
      case FieldAnnotationTypesConv._ignorePropName:
        return FieldAnnotationTypes.ignoreProp;
      default:
        return null;
    }
  }

  @override
  Object? toJson(FieldAnnotationTypes? object) => object?.serialized;
}
