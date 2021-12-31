// coverage:ignore-file
// ignore_for_file: constant_identifier_names,prefer_const_declarations,unused_local_variable,prefer_int_literals,lines_longer_than_80_chars,prefer_const_constructors

import 'package:ice_annotation/ice.dart';

/// Extensions for the enum CopyWith
extension CopyWithX on CopyWith {
  /// Map of all values of the enum
  T map<T extends Object?>({
    required T simple,
    required T anonymous,
    required T nullSafe,
    required T none,
  }) {
    switch (this) {
      case CopyWith.simple:
        return simple;
      case CopyWith.anonymous:
        return anonymous;
      case CopyWith.nullSafe:
        return nullSafe;
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
    T? anonymous,
    T? nullSafe,
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
      case CopyWith.anonymous:
        if (anonymous == null && !isNullable) return orElse;
        return anonymous as T;
      case CopyWith.nullSafe:
        if (nullSafe == null && !isNullable) return orElse;
        return nullSafe as T;
      case CopyWith.none:
        if (none == null && !isNullable) return orElse;
        return none as T;
    }
  }

  /// Returns the name of the enum field
  String get name {
    return map<String>(
      simple: 'simple',
      anonymous: 'anonymous',
      nullSafe: 'nullSafe',
      none: 'none',
    );
  }

  /// The enum value converted to an integer
  int get toInt {
    return map<int>(
      simple: 0,
      anonymous: 1,
      nullSafe: 2,
      none: 3,
    );
  }

  /// Returns the name of the enum field
  /// In a human readable format
  String get readable {
    return map<String>(
      simple: 'Simple',
      anonymous: 'Anonymous',
      nullSafe: 'Null Safe',
      none: 'None',
    );
  }

  /// Returns the description of the enum field.
  ///
  /// If the description is null, the doc comment of the enum field is returned.
  String? get description {
    return map<String?>(
      simple: '''
NOT `null` safe

```dart
myClass.copyWith(field: newValue);
```''',
      anonymous: '''
'null' safe

```dart
myClass.copyWith(field: (currentValue) => newValue);
```''',
      nullSafe: '''
'null' safe

```dart
myClass.copyWith(field: newValue);
```''',
      none: '''
does not generate a copyWith method''',
    );
  }

  /// Returns the serialized value of the enum field.
  Object get serialized {
    return map<Object>(
      simple: CopyWithConv._simpleName,
      anonymous: CopyWithConv._anonymousName,
      nullSafe: CopyWithConv._nullSafeName,
      none: CopyWithConv._noneName,
    );
  }
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
  static const _anonymousName = 'anonymous';
  static const _nullSafeName = 'nullSafe';
  static const _noneName = 'none';

  @override
  CopyWith fromJson(Object json) {
    switch (json) {
      case _simpleName:
        return CopyWith.simple;
      case _anonymousName:
        return CopyWith.anonymous;
      case _nullSafeName:
        return CopyWith.nullSafe;
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
      case CopyWithConv._anonymousName:
        return CopyWith.anonymous;
      case CopyWithConv._nullSafeName:
        return CopyWith.nullSafe;
      case CopyWithConv._noneName:
        return CopyWith.none;
      default:
        return null;
    }
  }

  @override
  Object? toJson(CopyWith? object) => object?.serialized;
}
