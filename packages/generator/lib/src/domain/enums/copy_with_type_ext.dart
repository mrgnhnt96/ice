// coverage:ignore-file
// ignore_for_file: constant_identifier_names,prefer_const_declarations,unused_local_variable,prefer_int_literals,lines_longer_than_80_chars,prefer_const_constructors

import 'package:ice_annotation/ice.dart';

/// Extensions for the enum CopyWithType
extension CopyWithTypeX on CopyWithType {
  /// Map of all values of the enum
  T map<T extends Object?>({
    required T simple,
    required T typeSafe,
  }) {
    switch (this) {
      case CopyWithType.simple:
        return simple;
      case CopyWithType.typeSafe:
        return typeSafe;
    }
  }

  /// Optionally map all values of the enum
  ///
  /// default value is provided when value has not been mapped
  T maybeMap<T extends Object?>({
    required T orElse,
    T? simple,
    T? typeSafe,
  }) {
    var isNullable = true;
    try {
      final value = null as T;
    } catch (_) {
      isNullable = false;
    }

    switch (this) {
      case CopyWithType.simple:
        if (simple == null && !isNullable) return orElse;
        return simple as T;
      case CopyWithType.typeSafe:
        if (typeSafe == null && !isNullable) return orElse;
        return typeSafe as T;
    }
  }

  /// Returns the name of the enum field
  String get name {
    return map<String>(
      simple: 'simple',
      typeSafe: 'typeSafe',
    );
  }

  /// The enum value converted to an integer
  int get toInt {
    return map<int>(
      simple: 0,
      typeSafe: 1,
    );
  }

  /// Returns the name of the enum field
  /// In a human readable format
  String get readable {
    return map<String>(
      simple: 'Simple',
      typeSafe: 'Type Safe',
    );
  }

  /// Returns the description of the enum field.
  ///
  /// If the description is null, the doc comment of the enum field is returned.
  String? get description {
    return map<String?>(
      simple: '''
If `null` is passed within the `copyWith` method,
the current value will be returned.

```dart
myClass.copyWith(field: newValue);
```''',
      typeSafe: '''
if `null` is passed within the `copyWith` method,
`null` will be returned.

```dart
myClass.copyWith(field: (currentValue) => newValue);
```''',
    );
  }

  /// Returns the serialized value of the enum field.
  Object get serialized {
    return map<Object>(
      simple: CopyWithTypeConv._simpleName,
      typeSafe: CopyWithTypeConv._typeSafeName,
    );
  }

  /// if the enum value is `simple`
  bool get isSimple => this == CopyWithType.simple;

  /// if the enum value is `typeSafe`
  bool get isTypeSafe => this == CopyWithType.typeSafe;
}

/// {@template copy_with_type.json_converter}
/// Serializes [CopyWithType] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @CopyWithTypeConv()
/// final CopyWithType myEnum;
/// ```
/// {@endtemplate}
class CopyWithTypeConv extends JsonConverter<CopyWithType, Object> {
  /// {@macro copy_with_type.json_converter}
  const CopyWithTypeConv({this.defaultValue});

  /// the value to be used when no match is found
  final CopyWithType? defaultValue;

  /// {@macro copy_with_type.json_converter_nullable}
  static const nullable = _CopyWithTypeNullableConv();

  static const _simpleName = 'simple';
  static const _typeSafeName = 'typeSafe';

  @override
  CopyWithType fromJson(Object json) {
    switch (json) {
      case _simpleName:
        return CopyWithType.simple;
      case _typeSafeName:
        return CopyWithType.typeSafe;
      default:
        if (defaultValue != null) return defaultValue!;

        throw Exception('Unknown field: $json');
    }
  }

  @override
  Object toJson(CopyWithType object) => object.serialized;
}

/// {@template copy_with_type.json_converter_nullable}
/// Serializes [CopyWithType?] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @CopyWithTypeConv.nullable
/// final CopyWithType? myEnum;
/// ```
/// {@endtemplate}
class _CopyWithTypeNullableConv extends JsonConverter<CopyWithType?, Object?> {
  /// {@macro copy_with_type.json_converter}
  const _CopyWithTypeNullableConv();

  @override
  CopyWithType? fromJson(Object? json) {
    switch (json) {
      case CopyWithTypeConv._simpleName:
        return CopyWithType.simple;
      case CopyWithTypeConv._typeSafeName:
        return CopyWithType.typeSafe;
      default:
        return null;
    }
  }

  @override
  Object? toJson(CopyWithType? object) => object?.serialized;
}
