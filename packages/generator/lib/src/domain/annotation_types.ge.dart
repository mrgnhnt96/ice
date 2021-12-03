// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: constant_identifier_names,prefer_const_declarations,unused_local_variable,prefer_int_literals,lines_longer_than_80_chars,prefer_const_constructors

part of 'annotation_types.dart';

// **************************************************************************
// EnumAssistGenerator
// **************************************************************************

/// Extensions for the enum AnnotationTypes
extension AnnotationTypesX on AnnotationTypes {
  /// Map of all values of the enum
  T map<T extends Object?>({
    required T ice,
    required T union,
    required T unionBase,
    required T entryPoint,
    required T other,
  }) {
    switch (this) {
      case AnnotationTypes.ice:
        return ice;
      case AnnotationTypes.union:
        return union;
      case AnnotationTypes.unionBase:
        return unionBase;
      case AnnotationTypes.entryPoint:
        return entryPoint;
      case AnnotationTypes.other:
        return other;
    }
  }

  /// Optionally map all values of the enum
  ///
  /// default value is provided when value has not been mapped
  T maybeMap<T extends Object?>({
    required T orElse,
    T? ice,
    T? union,
    T? unionBase,
    T? entryPoint,
    T? other,
  }) {
    var isNullable = true;
    try {
      final value = null as T;
    } catch (_) {
      isNullable = false;
    }

    switch (this) {
      case AnnotationTypes.ice:
        if (ice == null && !isNullable) return orElse;
        return ice as T;
      case AnnotationTypes.union:
        if (union == null && !isNullable) return orElse;
        return union as T;
      case AnnotationTypes.unionBase:
        if (unionBase == null && !isNullable) return orElse;
        return unionBase as T;
      case AnnotationTypes.entryPoint:
        if (entryPoint == null && !isNullable) return orElse;
        return entryPoint as T;
      case AnnotationTypes.other:
        if (other == null && !isNullable) return orElse;
        return other as T;
    }
  }

  /// Returns the name of the enum field
  String get name {
    return map<String>(
      ice: 'ice',
      union: 'union',
      unionBase: 'unionBase',
      entryPoint: 'entryPoint',
      other: 'other',
    );
  }

  /// The enum value converted to an integer
  int get toInt {
    return map<int>(
      ice: 0,
      union: 1,
      unionBase: 2,
      entryPoint: 3,
      other: 4,
    );
  }

  /// Returns the name of the enum field
  /// In a human readable format
  String get readable {
    return map<String>(
      ice: 'Ice',
      union: 'Union',
      unionBase: 'Union Base',
      entryPoint: 'Entry Point',
      other: 'Other',
    );
  }

  /// Returns the description of the enum field.
  ///
  /// If the description is null, the doc comment of the enum field is returned.
  String? get description {
    return map<String?>(
      ice: '''
[Ice]''',
      union: '''
[IceUnion]''',
      unionBase: '''
[IceUnionBase]''',
      entryPoint: '''
[CopyWithEntryPoint]''',
      other: '''
any other annotation''',
    );
  }

  /// Returns the serialized value of the enum field.
  Object get serialized {
    return map<Object>(
      ice: AnnotationTypesConv._iceName,
      union: AnnotationTypesConv._unionName,
      unionBase: AnnotationTypesConv._unionBaseName,
      entryPoint: AnnotationTypesConv._entryPointName,
      other: AnnotationTypesConv._otherName,
    );
  }
}

/// {@template annotation_types.json_converter}
/// Serializes [AnnotationTypes] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @AnnotationTypesConv()
/// final AnnotationTypes myEnum;
/// ```
/// {@endtemplate}
class AnnotationTypesConv extends JsonConverter<AnnotationTypes, Object> {
  /// {@macro annotation_types.json_converter}
  const AnnotationTypesConv({this.defaultValue});

  /// the value to be used when no match is found
  final AnnotationTypes? defaultValue;

  /// {@macro annotation_types.json_converter_nullable}
  static const nullable = _AnnotationTypesNullableConv();

  static const _iceName = 'Ice';
  static const _unionName = 'Ice.union';
  static const _unionBaseName = 'IceUnionBase';
  static const _entryPointName = 'CopyWithEntryPoint';
  static const _otherName = 'other';

  @override
  AnnotationTypes fromJson(Object json) {
    switch (json) {
      case _iceName:
        return AnnotationTypes.ice;
      case _unionName:
        return AnnotationTypes.union;
      case _unionBaseName:
        return AnnotationTypes.unionBase;
      case _entryPointName:
        return AnnotationTypes.entryPoint;
      case _otherName:
        return AnnotationTypes.other;
      default:
        if (defaultValue != null) return defaultValue!;

        throw Exception('Unknown field: $json');
    }
  }

  @override
  Object toJson(AnnotationTypes object) => object.serialized;
}

/// {@template annotation_types.json_converter_nullable}
/// Serializes [AnnotationTypes?] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @AnnotationTypesConv.nullable
/// final AnnotationTypes? myEnum;
/// ```
/// {@endtemplate}
class _AnnotationTypesNullableConv
    extends JsonConverter<AnnotationTypes?, Object?> {
  /// {@macro annotation_types.json_converter}
  const _AnnotationTypesNullableConv();

  @override
  AnnotationTypes? fromJson(Object? json) {
    switch (json) {
      case AnnotationTypesConv._iceName:
        return AnnotationTypes.ice;
      case AnnotationTypesConv._unionName:
        return AnnotationTypes.union;
      case AnnotationTypesConv._unionBaseName:
        return AnnotationTypes.unionBase;
      case AnnotationTypesConv._entryPointName:
        return AnnotationTypes.entryPoint;
      case AnnotationTypesConv._otherName:
        return AnnotationTypes.other;
      default:
        return null;
    }
  }

  @override
  Object? toJson(AnnotationTypes? object) => object?.serialized;
}
