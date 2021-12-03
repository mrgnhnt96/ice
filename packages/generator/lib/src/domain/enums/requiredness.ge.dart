// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: constant_identifier_names,prefer_const_declarations,unused_local_variable,prefer_int_literals,lines_longer_than_80_chars,prefer_const_constructors

part of 'requiredness.dart';

// **************************************************************************
// EnumAssistGenerator
// **************************************************************************

/// Extensions for the enum Requiredness
extension RequirednessX on Requiredness {
  /// Map of all values of the enum
  T map<T extends Object?>({
    required T required,
    required T optional,
  }) {
    switch (this) {
      case Requiredness.required:
        return required;
      case Requiredness.optional:
        return optional;
    }
  }

  /// Optionally map all values of the enum
  ///
  /// default value is provided when value has not been mapped
  T maybeMap<T extends Object?>({
    required T orElse,
    T? required,
    T? optional,
  }) {
    var isNullable = true;
    try {
      final value = null as T;
    } catch (_) {
      isNullable = false;
    }

    switch (this) {
      case Requiredness.required:
        if (required == null && !isNullable) return orElse;
        return required as T;
      case Requiredness.optional:
        if (optional == null && !isNullable) return orElse;
        return optional as T;
    }
  }

  /// Returns the name of the enum field
  String get name {
    return map<String>(
      required: 'required',
      optional: 'optional',
    );
  }

  /// The enum value converted to an integer
  int get toInt {
    return map<int>(
      required: 0,
      optional: 1,
    );
  }

  /// Returns the name of the enum field
  /// In a human readable format
  String get readable {
    return map<String>(
      required: 'Required',
      optional: 'Optional',
    );
  }

  /// Returns the description of the enum field.
  ///
  /// If the description is null, the doc comment of the enum field is returned.
  String? get description {
    return map<String?>(
      required: '''
`Example({required String name})`
`Example(String name)`''',
      optional: '''
`Example({String? name})`
`Example([String? name])`''',
    );
  }

  /// Returns the serialized value of the enum field.
  Object get serialized {
    return map<Object>(
      required: RequirednessConv._requiredName,
      optional: RequirednessConv._optionalName,
    );
  }
}

/// {@template requiredness.json_converter}
/// Serializes [Requiredness] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @RequirednessConv()
/// final Requiredness myEnum;
/// ```
/// {@endtemplate}
class RequirednessConv extends JsonConverter<Requiredness, Object> {
  /// {@macro requiredness.json_converter}
  const RequirednessConv({this.defaultValue});

  /// the value to be used when no match is found
  final Requiredness? defaultValue;

  /// {@macro requiredness.json_converter_nullable}
  static const nullable = _RequirednessNullableConv();

  static const _requiredName = 'required';
  static const _optionalName = 'optional';

  @override
  Requiredness fromJson(Object json) {
    switch (json) {
      case _requiredName:
        return Requiredness.required;
      case _optionalName:
        return Requiredness.optional;
      default:
        if (defaultValue != null) return defaultValue!;

        throw Exception('Unknown field: $json');
    }
  }

  @override
  Object toJson(Requiredness object) => object.serialized;
}

/// {@template requiredness.json_converter_nullable}
/// Serializes [Requiredness?] to and from json
///
/// Can be used as annotation for `json_serializable` classes
///
/// ```dart
/// @RequirednessConv.nullable
/// final Requiredness? myEnum;
/// ```
/// {@endtemplate}
class _RequirednessNullableConv extends JsonConverter<Requiredness?, Object?> {
  /// {@macro requiredness.json_converter}
  const _RequirednessNullableConv();

  @override
  Requiredness? fromJson(Object? json) {
    switch (json) {
      case RequirednessConv._requiredName:
        return Requiredness.required;
      case RequirednessConv._optionalName:
        return Requiredness.optional;
      default:
        return null;
    }
  }

  @override
  Object? toJson(Requiredness? object) => object?.serialized;
}
