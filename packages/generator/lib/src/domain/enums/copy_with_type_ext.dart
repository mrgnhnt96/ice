// coverage:ignore-file
// ignore_for_file: constant_identifier_names,prefer_const_declarations,unused_local_variable,prefer_int_literals,lines_longer_than_80_chars,prefer_const_constructors

import 'package:ice_annotation/ice.dart';

/// Extensions for the enum CopyWith
extension CopyWithX on CopyWith {
  /// Map of all values of the enum
  T map<T extends Object?>({
    required T simple,
    required T typeSafe,
    required T none,
  }) {
    switch (this) {
      case CopyWith.simple:
        return simple;
      case CopyWith.typeSafe:
        return typeSafe;
      case CopyWith.none:
        return none;
    }
  }

  /// Optionally map all values of the enum
  ///
  /// default value is provided when value has not been mapped
  T maybeMap<T extends Object?>({
    required T orElse,
    T? simple,
    T? typeSafe,
    T? none,
  }) {
    var isNullable = true;
    try {
      final value = null as T;
    } catch (_) {
      isNullable = false;
    }

    switch (this) {
      case CopyWith.simple:
        if (simple == null && !isNullable) return orElse;
        return simple as T;
      case CopyWith.typeSafe:
        if (typeSafe == null && !isNullable) return orElse;
        return typeSafe as T;
      case CopyWith.none:
        if (none == null && !isNullable) return orElse;
        return none as T;
    }
  }

  /// Returns the name of the enum field
  String get name {
    return map<String>(
      simple: 'simple',
      typeSafe: 'typeSafe',
      none: 'none',
    );
  }

  /// The enum value converted to an integer
  int get toInt {
    return map<int>(
      simple: 0,
      typeSafe: 1,
      none: 2,
    );
  }

  /// Returns the name of the enum field
  /// In a human readable format
  String get readable {
    return map<String>(
      simple: 'Simple',
      typeSafe: 'Type Safe',
      none: 'None',
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
      none: '''
does not generate a copyWith method''',
    );
  }

  /// Returns the serialized value of the enum field.
  Object get serialized {
    return map<Object>(
      simple: CopyWithConv._simpleName,
      typeSafe: CopyWithConv._typeSafeName,
      none: CopyWithConv._noneName,
    );
  }

  /// if the enum value is `simple`
  bool get isSimple => this == CopyWith.simple;

  /// if the enum value is `typeSafe`
  bool get isTypeSafe => this == CopyWith.typeSafe;

  /// if the enum value is `none`
  bool get isNone => this == CopyWith.none;
}

/// {@template copy_with.json_converter}
/// Serializes [CopyWith] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @CopyWithConv()
/// final CopyWith myEnum;
/// ```
/// {@endtemplate}
class CopyWithConv extends JsonConverter<CopyWith, Object> {
  /// {@macro copy_with.json_converter}
  const CopyWithConv({this.defaultValue});

  /// the value to be used when no match is found
  final CopyWith? defaultValue;

  /// {@macro copy_with.json_converter_nullable}
  static const nullable = _CopyWithNullableConv();

  static const _simpleName = 'simple';
  static const _typeSafeName = 'typeSafe';
  static const _noneName = 'none';

  @override
  CopyWith fromJson(Object json) {
    switch (json) {
      case _simpleName:
        return CopyWith.simple;
      case _typeSafeName:
        return CopyWith.typeSafe;
      case _noneName:
        return CopyWith.none;
      default:
        if (defaultValue != null) return defaultValue!;

        throw Exception('Unknown field: $json');
    }
  }

  @override
  Object toJson(CopyWith object) => object.serialized;
}

/// {@template copy_with.json_converter_nullable}
/// Serializes [CopyWith?] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @CopyWithConv.nullable
/// final CopyWith? myEnum;
/// ```
/// {@endtemplate}
class _CopyWithNullableConv extends JsonConverter<CopyWith?, Object?> {
  /// {@macro copy_with.json_converter}
  const _CopyWithNullableConv();

  @override
  CopyWith? fromJson(Object? json) {
    switch (json) {
      case CopyWithConv._simpleName:
        return CopyWith.simple;
      case CopyWithConv._typeSafeName:
        return CopyWith.typeSafe;
      case CopyWithConv._noneName:
        return CopyWith.none;
      default:
        return null;
    }
  }

  @override
  Object? toJson(CopyWith? object) => object?.serialized;
}

/// {@template copy_with_type.json_converter}
/// Serializes [CopyWith] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @CopyWithTypeConv()
/// final CopyWithType myEnum;
/// ```
/// {@endtemplate}
class CopyWithTypeConv extends JsonConverter<CopyWith, Object> {
  /// {@macro copy_with_type.json_converter}
  const CopyWithTypeConv({this.defaultValue});

  /// the value to be used when no match is found
  final CopyWith? defaultValue;

  /// {@macro copy_with_type.json_converter_nullable}
  static const nullable = _CopyWithTypeNullableConv();

  static const _simpleName = 'simple';
  static const _typeSafeName = 'typeSafe';

  @override
  CopyWith fromJson(Object json) {
    switch (json) {
      case _simpleName:
        return CopyWith.simple;
      case _typeSafeName:
        return CopyWith.typeSafe;
      default:
        if (defaultValue != null) return defaultValue!;

        throw Exception('Unknown field: $json');
    }
  }

  @override
  Object toJson(CopyWith object) => object.serialized;
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
class _CopyWithTypeNullableConv extends JsonConverter<CopyWith?, Object?> {
  /// {@macro copy_with_type.json_converter}
  const _CopyWithTypeNullableConv();

  @override
  CopyWith? fromJson(Object? json) {
    switch (json) {
      case CopyWithTypeConv._simpleName:
        return CopyWith.simple;
      case CopyWithTypeConv._typeSafeName:
        return CopyWith.typeSafe;
      default:
        return null;
    }
  }

  @override
  Object? toJson(CopyWith? object) => object?.serialized;
}
