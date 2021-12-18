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
    required T jsonSerializable,
    required T jsonKey,
    required T unionBase,
    required T unionOf,
    required T copyWithConstructor,
    required T props,
    required T ignoreProp,
    required T tostring,
    required T copyWithSimple,
    required T copyWithTypeSafe,
    required T other,
  }) {
    switch (this) {
      case AnnotationTypes.ice:
        return ice;
      case AnnotationTypes.jsonSerializable:
        return jsonSerializable;
      case AnnotationTypes.jsonKey:
        return jsonKey;
      case AnnotationTypes.unionBase:
        return unionBase;
      case AnnotationTypes.unionOf:
        return unionOf;
      case AnnotationTypes.copyWithConstructor:
        return copyWithConstructor;
      case AnnotationTypes.props:
        return props;
      case AnnotationTypes.ignoreProp:
        return ignoreProp;
      case AnnotationTypes.tostring:
        return tostring;
      case AnnotationTypes.copyWithSimple:
        return copyWithSimple;
      case AnnotationTypes.copyWithTypeSafe:
        return copyWithTypeSafe;
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
    T? jsonSerializable,
    T? jsonKey,
    T? unionBase,
    T? unionOf,
    T? copyWithConstructor,
    T? props,
    T? ignoreProp,
    T? tostring,
    T? copyWithSimple,
    T? copyWithTypeSafe,
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
      case AnnotationTypes.jsonSerializable:
        if (jsonSerializable == null && !isNullable) return orElse;
        return jsonSerializable as T;
      case AnnotationTypes.jsonKey:
        if (jsonKey == null && !isNullable) return orElse;
        return jsonKey as T;
      case AnnotationTypes.unionBase:
        if (unionBase == null && !isNullable) return orElse;
        return unionBase as T;
      case AnnotationTypes.unionOf:
        if (unionOf == null && !isNullable) return orElse;
        return unionOf as T;
      case AnnotationTypes.copyWithConstructor:
        if (copyWithConstructor == null && !isNullable) return orElse;
        return copyWithConstructor as T;
      case AnnotationTypes.props:
        if (props == null && !isNullable) return orElse;
        return props as T;
      case AnnotationTypes.ignoreProp:
        if (ignoreProp == null && !isNullable) return orElse;
        return ignoreProp as T;
      case AnnotationTypes.tostring:
        if (tostring == null && !isNullable) return orElse;
        return tostring as T;
      case AnnotationTypes.copyWithSimple:
        if (copyWithSimple == null && !isNullable) return orElse;
        return copyWithSimple as T;
      case AnnotationTypes.copyWithTypeSafe:
        if (copyWithTypeSafe == null && !isNullable) return orElse;
        return copyWithTypeSafe as T;
      case AnnotationTypes.other:
        if (other == null && !isNullable) return orElse;
        return other as T;
    }
  }

  /// Returns the name of the enum field
  String get name {
    return map<String>(
      ice: 'ice',
      jsonSerializable: 'jsonSerializable',
      jsonKey: 'jsonKey',
      unionBase: 'unionBase',
      unionOf: 'unionOf',
      copyWithConstructor: 'copyWithConstructor',
      props: 'props',
      ignoreProp: 'ignoreProp',
      tostring: 'tostring',
      copyWithSimple: 'copyWithSimple',
      copyWithTypeSafe: 'copyWithTypeSafe',
      other: 'other',
    );
  }

  /// The enum value converted to an integer
  int get toInt {
    return map<int>(
      ice: 0,
      jsonSerializable: 1,
      jsonKey: 2,
      unionBase: 3,
      unionOf: 4,
      copyWithConstructor: 5,
      props: 6,
      ignoreProp: 7,
      tostring: 8,
      copyWithSimple: 9,
      copyWithTypeSafe: 10,
      other: 11,
    );
  }

  /// Returns the name of the enum field
  /// In a human readable format
  String get readable {
    return map<String>(
      ice: 'Ice',
      jsonSerializable: 'Json Serializable',
      jsonKey: 'Json Key',
      unionBase: 'Union Base',
      unionOf: 'Union Of',
      copyWithConstructor: 'Copy With Constructor',
      props: 'Props',
      ignoreProp: 'Ignore Prop',
      tostring: 'Tostring',
      copyWithSimple: 'Copy With Simple',
      copyWithTypeSafe: 'Copy With Type Safe',
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
      jsonSerializable: '''
[JsonSerializable]''',
      jsonKey: '''
[JsonKey]''',
      unionBase: '''
[IceUnion]''',
      unionOf: '''
[IceUnion]''',
      copyWithConstructor: '''
[CopyWithConstructor]''',
      props: '''
[Props]''',
      ignoreProp: '''
[IgnoreProp]''',
      tostring: '''
[ToString]''',
      copyWithSimple: '''
[CopyWith]''',
      copyWithTypeSafe: '''
[CopyWithTypeSafe]''',
      other: '''
any other annotation''',
    );
  }

  /// Returns the serialized value of the enum field.
  Object get serialized {
    return map<Object>(
      ice: AnnotationTypesConv._iceName,
      jsonSerializable: AnnotationTypesConv._jsonSerializableName,
      jsonKey: AnnotationTypesConv._jsonKeyName,
      unionBase: AnnotationTypesConv._unionBaseName,
      unionOf: AnnotationTypesConv._unionOfName,
      copyWithConstructor: AnnotationTypesConv._copyWithConstructorName,
      props: AnnotationTypesConv._propsName,
      ignoreProp: AnnotationTypesConv._ignorePropName,
      tostring: AnnotationTypesConv._tostringName,
      copyWithSimple: AnnotationTypesConv._copyWithSimpleName,
      copyWithTypeSafe: AnnotationTypesConv._copyWithTypeSafeName,
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
  static const _jsonSerializableName = 'JsonSerializable';
  static const _jsonKeyName = 'JsonKey';
  static const _unionBaseName = 'IceUnion.create';
  static const _unionOfName = 'IceUnion.of';
  static const _copyWithConstructorName = 'CopyWith.constructor';
  static const _propsName = 'props';
  static const _ignorePropName = 'ignoreProp';
  static const _tostringName = 'toString';
  static const _copyWithSimpleName = 'CopyWith.simple';
  static const _copyWithTypeSafeName = 'CopyWith.typeSafe';
  static const _otherName = 'other';

  @override
  AnnotationTypes fromJson(Object json) {
    switch (json) {
      case _iceName:
        return AnnotationTypes.ice;
      case _jsonSerializableName:
        return AnnotationTypes.jsonSerializable;
      case _jsonKeyName:
        return AnnotationTypes.jsonKey;
      case _unionBaseName:
        return AnnotationTypes.unionBase;
      case _unionOfName:
        return AnnotationTypes.unionOf;
      case _copyWithConstructorName:
        return AnnotationTypes.copyWithConstructor;
      case _propsName:
        return AnnotationTypes.props;
      case _ignorePropName:
        return AnnotationTypes.ignoreProp;
      case _tostringName:
        return AnnotationTypes.tostring;
      case _copyWithSimpleName:
        return AnnotationTypes.copyWithSimple;
      case _copyWithTypeSafeName:
        return AnnotationTypes.copyWithTypeSafe;
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
      case AnnotationTypesConv._jsonSerializableName:
        return AnnotationTypes.jsonSerializable;
      case AnnotationTypesConv._jsonKeyName:
        return AnnotationTypes.jsonKey;
      case AnnotationTypesConv._unionBaseName:
        return AnnotationTypes.unionBase;
      case AnnotationTypesConv._unionOfName:
        return AnnotationTypes.unionOf;
      case AnnotationTypesConv._copyWithConstructorName:
        return AnnotationTypes.copyWithConstructor;
      case AnnotationTypesConv._propsName:
        return AnnotationTypes.props;
      case AnnotationTypesConv._ignorePropName:
        return AnnotationTypes.ignoreProp;
      case AnnotationTypesConv._tostringName:
        return AnnotationTypes.tostring;
      case AnnotationTypesConv._copyWithSimpleName:
        return AnnotationTypes.copyWithSimple;
      case AnnotationTypesConv._copyWithTypeSafeName:
        return AnnotationTypes.copyWithTypeSafe;
      case AnnotationTypesConv._otherName:
        return AnnotationTypes.other;
      default:
        return null;
    }
  }

  @override
  Object? toJson(AnnotationTypes? object) => object?.serialized;
}
