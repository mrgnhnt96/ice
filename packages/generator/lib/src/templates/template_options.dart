part of 'template.dart';

/// The methods that will be generated with the [Ice] annotation
enum TemplateType {
  /// the copyWith method will be generated
  copyWith,

  /// Equatable will be generated
  equatable,

  /// iceToString will be generated
  iceToString,

  /// toJson will be generated
  toJson,

  /// fromJson will be generated
  fromJson,

  /// any other option
  wrapper,
}

///
extension TemplateTypeX on TemplateType {
  ///
  bool get isCopyWith => this == TemplateType.copyWith;

  ///
  bool get isEquatable => this == TemplateType.equatable;

  ///
  bool get isIceToString => this == TemplateType.iceToString;

  ///
  bool get isToJson => this == TemplateType.toJson;

  ///
  bool get isFromJson => this == TemplateType.fromJson;

  ///
  bool get isWrapper => this == TemplateType.wrapper;
}
