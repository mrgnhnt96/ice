// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: constant_identifier_names,prefer_const_declarations,unused_local_variable,prefer_int_literals,lines_longer_than_80_chars,prefer_const_constructors

part of 'method_to_ignore.dart';

// **************************************************************************
// EnumAssistGenerator
// **************************************************************************

/// Extensions for the enum MethodsToIgnore
extension MethodsToIgnoreX on MethodsToIgnore {
  /// Map of all values of the enum
  T map<T extends Object?>({
    required T toJson,
    required T string,
    required T props,
    required T copyWith,
    required T other,
  }) {
    switch (this) {
      case MethodsToIgnore.toJson:
        return toJson;
      case MethodsToIgnore.string:
        return string;
      case MethodsToIgnore.props:
        return props;
      case MethodsToIgnore.copyWith:
        return copyWith;
      case MethodsToIgnore.other:
        return other;
    }
  }

  /// Optionally map all values of the enum
  ///
  /// default value is provided when value has not been mapped
  T maybeMap<T extends Object?>({
    required T orElse,
    T? toJson,
    T? string,
    T? props,
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
      case MethodsToIgnore.toJson:
        if (toJson == null && !isNullable) return orElse;
        return toJson as T;
      case MethodsToIgnore.string:
        if (string == null && !isNullable) return orElse;
        return string as T;
      case MethodsToIgnore.props:
        if (props == null && !isNullable) return orElse;
        return props as T;
      case MethodsToIgnore.copyWith:
        if (copyWith == null && !isNullable) return orElse;
        return copyWith as T;
      case MethodsToIgnore.other:
        if (other == null && !isNullable) return orElse;
        return other as T;
    }
  }

  /// Returns the name of the enum field
  String get name {
    return map<String>(
      toJson: 'toJson',
      string: 'string',
      props: 'props',
      copyWith: 'copyWith',
      other: 'other',
    );
  }

  /// The enum value converted to an integer
  int get toInt {
    return map<int>(
      toJson: 0,
      string: 1,
      props: 2,
      copyWith: 3,
      other: 4,
    );
  }

  /// Returns the name of the enum field
  /// In a human readable format
  String get readable {
    return map<String>(
      toJson: 'To Json',
      string: 'String',
      props: 'Props',
      copyWith: 'Copy With',
      other: 'Other',
    );
  }

  /// Returns the description of the enum field.
  ///
  /// If the description is null, the doc comment of the enum field is returned.
  String? get description {
    return map<String?>(
      toJson: '''
a method named toJson''',
      string: '''
a method named string''',
      props: '''
a method named props''',
      copyWith: '''
a method named copyWith''',
      other: '''
any other method

`other` is the only option that will be generated''',
    );
  }

  /// Returns the serialized value of the enum field.
  Object get serialized {
    return map<Object>(
      toJson: MethodsToIgnoreConv._toJsonName,
      string: MethodsToIgnoreConv._stringName,
      props: MethodsToIgnoreConv._propsName,
      copyWith: MethodsToIgnoreConv._copyWithName,
      other: MethodsToIgnoreConv._otherName,
    );
  }
}

/// {@template methods_to_ignore.json_converter}
/// Serializes [MethodsToIgnore] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @MethodsToIgnoreConv()
/// final MethodsToIgnore myEnum;
/// ```
/// {@endtemplate}
class MethodsToIgnoreConv extends JsonConverter<MethodsToIgnore, Object> {
  /// {@macro methods_to_ignore.json_converter}
  const MethodsToIgnoreConv({this.defaultValue});

  /// the value to be used when no match is found
  final MethodsToIgnore? defaultValue;

  /// {@macro methods_to_ignore.json_converter_nullable}
  static const nullable = _MethodsToIgnoreNullableConv();

  static const _toJsonName = 'toJson';
  static const _stringName = 'iceToString';
  static const _propsName = 'props';
  static const _copyWithName = 'copyWith';
  static const _otherName = 'other';

  @override
  MethodsToIgnore fromJson(Object json) {
    switch (json) {
      case _toJsonName:
        return MethodsToIgnore.toJson;
      case _stringName:
        return MethodsToIgnore.string;
      case _propsName:
        return MethodsToIgnore.props;
      case _copyWithName:
        return MethodsToIgnore.copyWith;
      case _otherName:
        return MethodsToIgnore.other;
      default:
        if (defaultValue != null) return defaultValue!;

        throw Exception('Unknown field: $json');
    }
  }

  @override
  Object toJson(MethodsToIgnore object) => object.serialized;
}

/// {@template methods_to_ignore.json_converter_nullable}
/// Serializes [MethodsToIgnore?] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @MethodsToIgnoreConv.nullable
/// final MethodsToIgnore? myEnum;
/// ```
/// {@endtemplate}
class _MethodsToIgnoreNullableConv
    extends JsonConverter<MethodsToIgnore?, Object?> {
  /// {@macro methods_to_ignore.json_converter}
  const _MethodsToIgnoreNullableConv();

  @override
  MethodsToIgnore? fromJson(Object? json) {
    switch (json) {
      case MethodsToIgnoreConv._toJsonName:
        return MethodsToIgnore.toJson;
      case MethodsToIgnoreConv._stringName:
        return MethodsToIgnore.string;
      case MethodsToIgnoreConv._propsName:
        return MethodsToIgnore.props;
      case MethodsToIgnoreConv._copyWithName:
        return MethodsToIgnore.copyWith;
      case MethodsToIgnoreConv._otherName:
        return MethodsToIgnore.other;
      default:
        return null;
    }
  }

  @override
  Object? toJson(MethodsToIgnore? object) => object?.serialized;
}
