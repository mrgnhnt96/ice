// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: constant_identifier_names,prefer_const_declarations,unused_local_variable,prefer_int_literals,lines_longer_than_80_chars,prefer_const_constructors

part of 'position_type.dart';

// **************************************************************************
// EnumAssistGenerator
// **************************************************************************

/// Extensions for the enum PositionType
extension PositionTypeX on PositionType {
  /// Map of all values of the enum
  T map<T extends Object?>({
    required T named,
    required T positioned,
  }) {
    switch (this) {
      case PositionType.named:
        return named;
      case PositionType.positioned:
        return positioned;
    }
  }

  /// Optionally map all values of the enum
  ///
  /// default value is provided when value has not been mapped
  T maybeMap<T extends Object?>({
    required T orElse,
    T? named,
    T? positioned,
  }) {
    var isNullable = true;
    try {
      final value = null as T;
    } catch (_) {
      isNullable = false;
    }

    switch (this) {
      case PositionType.named:
        if (named == null && !isNullable) return orElse;
        return named as T;
      case PositionType.positioned:
        if (positioned == null && !isNullable) return orElse;
        return positioned as T;
    }
  }

  /// Returns the name of the enum field
  String get name {
    return map<String>(
      named: 'named',
      positioned: 'positioned',
    );
  }

  /// The enum value converted to an integer
  int get toInt {
    return map<int>(
      named: 0,
      positioned: 1,
    );
  }

  /// Returns the name of the enum field
  /// In a human readable format
  String get readable {
    return map<String>(
      named: 'Named',
      positioned: 'Positioned',
    );
  }

  /// Returns the serialized value of the enum field.
  Object get serialized {
    return map<Object>(
      named: PositionTypeConv._namedName,
      positioned: PositionTypeConv._positionedName,
    );
  }
}

/// {@template position_type.json_converter}
/// Serializes [PositionType] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @PositionTypeConv()
/// final PositionType myEnum;
/// ```
/// {@endtemplate}
class PositionTypeConv extends JsonConverter<PositionType, Object> {
  /// {@macro position_type.json_converter}
  const PositionTypeConv({this.defaultValue});

  /// the value to be used when no match is found
  final PositionType? defaultValue;

  /// {@macro position_type.json_converter_nullable}
  static const nullable = _PositionTypeNullableConv();

  static const _namedName = 'named';
  static const _positionedName = 'positioned';

  @override
  PositionType fromJson(Object json) {
    switch (json) {
      case _namedName:
        return PositionType.named;
      case _positionedName:
        return PositionType.positioned;
      default:
        if (defaultValue != null) return defaultValue!;

        throw Exception('Unknown field: $json');
    }
  }

  @override
  Object toJson(PositionType object) => object.serialized;
}

/// {@template position_type.json_converter_nullable}
/// Serializes [PositionType?] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @PositionTypeConv.nullable
/// final PositionType? myEnum;
/// ```
/// {@endtemplate}
class _PositionTypeNullableConv extends JsonConverter<PositionType?, Object?> {
  /// {@macro position_type.json_converter}
  const _PositionTypeNullableConv();

  @override
  PositionType? fromJson(Object? json) {
    switch (json) {
      case PositionTypeConv._namedName:
        return PositionType.named;
      case PositionTypeConv._positionedName:
        return PositionType.positioned;
      default:
        return null;
    }
  }

  @override
  Object? toJson(PositionType? object) => object?.serialized;
}
