// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: constant_identifier_names,prefer_const_declarations,unused_local_variable,prefer_int_literals,lines_longer_than_80_chars,prefer_const_constructors

part of 'constructor_to_ignore.dart';

// **************************************************************************
// EnumAssistGenerator
// **************************************************************************

/// Extensions for the enum ConstructorToIgnore
extension ConstructorToIgnoreX on ConstructorToIgnore {
  /// Map of all values of the enum
  T map<T extends Object?>({
    required T fromJson,
    required T other,
  }) {
    switch (this) {
      case ConstructorToIgnore.fromJson:
        return fromJson;
      case ConstructorToIgnore.other:
        return other;
    }
  }

  /// Optionally map all values of the enum
  ///
  /// default value is provided when value has not been mapped
  T maybeMap<T extends Object?>({
    required T orElse,
    T? fromJson,
    T? other,
  }) {
    var isNullable = true;
    try {
      final value = null as T;
    } catch (_) {
      isNullable = false;
    }

    switch (this) {
      case ConstructorToIgnore.fromJson:
        if (fromJson == null && !isNullable) return orElse;
        return fromJson as T;
      case ConstructorToIgnore.other:
        if (other == null && !isNullable) return orElse;
        return other as T;
    }
  }

  /// Returns the name of the enum field
  String get name {
    return map<String>(
      fromJson: 'fromJson',
      other: 'other',
    );
  }

  /// The enum value converted to an integer
  int get toInt {
    return map<int>(
      fromJson: 0,
      other: 1,
    );
  }

  /// Returns the name of the enum field
  /// In a human readable format
  String get readable {
    return map<String>(
      fromJson: 'From Json',
      other: 'Other',
    );
  }

  /// Returns the description of the enum field.
  ///
  /// If the description is null, the doc comment of the enum field is returned.
  String? get description {
    return map<String?>(
      fromJson: '''
a constructor named `fromJson`''',
      other: '''
any other constructor,

this is the only option that will be generated''',
    );
  }

  /// Returns the serialized value of the enum field.
  Object get serialized {
    return map<Object>(
      fromJson: ConstructorToIgnoreConv._fromJsonName,
      other: ConstructorToIgnoreConv._otherName,
    );
  }
}

/// {@template constructor_to_ignore.json_converter}
/// Serializes [ConstructorToIgnore] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @ConstructorToIgnoreConv()
/// final ConstructorToIgnore myEnum;
/// ```
/// {@endtemplate}
class ConstructorToIgnoreConv
    extends JsonConverter<ConstructorToIgnore, Object> {
  /// {@macro constructor_to_ignore.json_converter}
  const ConstructorToIgnoreConv({this.defaultValue});

  /// the value to be used when no match is found
  final ConstructorToIgnore? defaultValue;

  /// {@macro constructor_to_ignore.json_converter_nullable}
  static const nullable = _ConstructorToIgnoreNullableConv();

  static const _fromJsonName = 'fromJson';
  static const _otherName = 'other';

  @override
  ConstructorToIgnore fromJson(Object json) {
    switch (json) {
      case _fromJsonName:
        return ConstructorToIgnore.fromJson;
      case _otherName:
        return ConstructorToIgnore.other;
      default:
        if (defaultValue != null) return defaultValue!;

        throw Exception('Unknown field: $json');
    }
  }

  @override
  Object toJson(ConstructorToIgnore object) => object.serialized;
}

/// {@template constructor_to_ignore.json_converter_nullable}
/// Serializes [ConstructorToIgnore?] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @ConstructorToIgnoreConv.nullable
/// final ConstructorToIgnore? myEnum;
/// ```
/// {@endtemplate}
class _ConstructorToIgnoreNullableConv
    extends JsonConverter<ConstructorToIgnore?, Object?> {
  /// {@macro constructor_to_ignore.json_converter}
  const _ConstructorToIgnoreNullableConv();

  @override
  ConstructorToIgnore? fromJson(Object? json) {
    switch (json) {
      case ConstructorToIgnoreConv._fromJsonName:
        return ConstructorToIgnore.fromJson;
      case ConstructorToIgnoreConv._otherName:
        return ConstructorToIgnore.other;
      default:
        return null;
    }
  }

  @override
  Object? toJson(ConstructorToIgnore? object) => object?.serialized;
}
