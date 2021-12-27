import 'package:ice_annotation/src/method_annotation.dart';
import 'package:meta/meta_meta.dart';

/// {@template ignore_prop}
/// A property that should be ignored and not be included in
/// the `props` getter.
/// {@endtemplate}
@Target({TargetKind.field})
class _IgnoreProp extends MethodAnnotation {
  /// {@macro ignore_prop}
  const _IgnoreProp();
}

///
class _JsonConstructor {
  ///
  const _JsonConstructor();
}

/// {@template copy_with_constructor}
/// The constructor of the class that will be used
/// as the copyWith entrypoint.
/// {@endtemplate}
class _CopyWithConstructor {
  /// {@macro copy_with_constructor}
  const _CopyWithConstructor();
}

/// {@template props}
/// Annotation to generate the `props` getter for Equatable classes.
/// {@endtemplate}
@Target({TargetKind.classType})
class _Props extends MethodAnnotation {
  /// {@macro props}
  const _Props();
}

/// {@template to_string}
/// Annotation to generate the iceToString method.
/// {@endtemplate}
@Target({TargetKind.classType})
class _ToString extends MethodAnnotation {
  /// {@macro to_string}
  const _ToString();
}

/// {@template copywith}
/// Annotation used to mark a class to generate a copyWith method.
/// {@endtemplate}
@Target({TargetKind.classType})
class IceCopyWith extends MethodAnnotation {
  /// {@macro copywith}
  const IceCopyWith._();

  /// Generates a simple copyWith method.
  static const simple = IceCopyWith._();

  /// Generates a type safe copyWith method
  static const typeSafe = IceCopyWith._();

  /// The constructor to be used in the generated copyWith method
  static const constructor = _CopyWithConstructor();
}

/// {@macro ignore_prop}
const iceIgnoreProp = _IgnoreProp();

/// {@macro to_string}
const iceToString = _ToString();

/// {@macro props}
const iceProps = _Props();

/// {@macro json_constructor}
const iceJsonConstructor = _JsonConstructor();
