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
    required T unionBase,
    required T copyWithEntryPoint,
    required T props,
    required T string,
    required T copyWith,
    required T other,
  }) {
    switch (this) {
      case AnnotationTypes.ice:
        return ice;
      case AnnotationTypes.unionBase:
        return unionBase;
      case AnnotationTypes.copyWithEntryPoint:
        return copyWithEntryPoint;
      case AnnotationTypes.props:
        return props;
      case AnnotationTypes.string:
        return string;
      case AnnotationTypes.copyWith:
        return copyWith;
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
    T? unionBase,
    T? copyWithEntryPoint,
    T? props,
    T? string,
    T? copyWith,
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
      case AnnotationTypes.unionBase:
        if (unionBase == null && !isNullable) return orElse;
        return unionBase as T;
      case AnnotationTypes.copyWithEntryPoint:
        if (copyWithEntryPoint == null && !isNullable) return orElse;
        return copyWithEntryPoint as T;
      case AnnotationTypes.props:
        if (props == null && !isNullable) return orElse;
        return props as T;
      case AnnotationTypes.string:
        if (string == null && !isNullable) return orElse;
        return string as T;
      case AnnotationTypes.copyWith:
        if (copyWith == null && !isNullable) return orElse;
        return copyWith as T;
      case AnnotationTypes.other:
        if (other == null && !isNullable) return orElse;
        return other as T;
    }
  }

  /// Returns the name of the enum field
  String get name {
    return map<String>(
      ice: 'ice',
      unionBase: 'unionBase',
      copyWithEntryPoint: 'copyWithEntryPoint',
      props: 'props',
      string: 'string',
      copyWith: 'copyWith',
      other: 'other',
    );
  }

  /// The enum value converted to an integer
  int get toInt {
    return map<int>(
      ice: 0,
      unionBase: 1,
      copyWithEntryPoint: 2,
      props: 3,
      string: 4,
      copyWith: 5,
      other: 6,
    );
  }

  /// Returns the name of the enum field
  /// In a human readable format
  String get readable {
    return map<String>(
      ice: 'Ice',
      unionBase: 'Union Base',
      copyWithEntryPoint: 'Copy With Entry Point',
      props: 'Props',
      string: 'String',
      copyWith: 'Copy With',
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
      unionBase: '''
[IceUnionBase]''',
      copyWithEntryPoint: '''
[CopyWithEntryPoint]''',
      props: null,
      string: null,
      copyWith: null,
      other: '''
any other annotation''',
    );
  }

  /// Returns the serialized value of the enum field.
  Object get serialized {
    return map<Object>(
      ice: AnnotationTypesConv._iceName,
      unionBase: AnnotationTypesConv._unionBaseName,
      copyWithEntryPoint: AnnotationTypesConv._copyWithEntryPointName,
      props: AnnotationTypesConv._propsName,
      string: AnnotationTypesConv._stringName,
      copyWith: AnnotationTypesConv._copyWithName,
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

  static const _iceName = 'ice';
  static const _unionBaseName = 'Ice.union';
  static const _copyWithEntryPointName = 'copyWithEntryPoint';
  static const _propsName = 'props';
  static const _stringName = 'toString';
  static const _copyWithName = 'copyWith';
  static const _otherName = 'other';

  @override
  AnnotationTypes fromJson(Object json) {
    switch (json) {
      case _iceName:
        return AnnotationTypes.ice;
      case _unionBaseName:
        return AnnotationTypes.unionBase;
      case _copyWithEntryPointName:
        return AnnotationTypes.copyWithEntryPoint;
      case _propsName:
        return AnnotationTypes.props;
      case _stringName:
        return AnnotationTypes.string;
      case _copyWithName:
        return AnnotationTypes.copyWith;
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
      case AnnotationTypesConv._unionBaseName:
        return AnnotationTypes.unionBase;
      case AnnotationTypesConv._copyWithEntryPointName:
        return AnnotationTypes.copyWithEntryPoint;
      case AnnotationTypesConv._propsName:
        return AnnotationTypes.props;
      case AnnotationTypesConv._stringName:
        return AnnotationTypes.string;
      case AnnotationTypesConv._copyWithName:
        return AnnotationTypes.copyWith;
      case AnnotationTypesConv._otherName:
        return AnnotationTypes.other;
      default:
        return null;
    }
  }

  @override
  Object? toJson(AnnotationTypes? object) => object?.serialized;
}
