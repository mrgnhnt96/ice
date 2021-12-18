import 'package:ice_annotation/src/methods/method.dart';
import 'package:meta/meta_meta.dart';

/// {@template copywith}
/// Annotation used to mark a class to generate a copyWith method.
/// {@endtemplate}
@Target({TargetKind.classType})
class CopyWith extends MethodAnnotation {
  /// {@macro copywith}
  const CopyWith._();

  /// Generates a simple copyWith method.
  static const simple = CopyWith._();

  /// Generates a type safe copyWith method
  static const typeSafe = CopyWith._();

  /// The constructor to be used in the generated copyWith method
  static const constructor = _CopyWithConstructor();
}

/// {@template copy_with_constructor}
/// The constructor of the class that will be used
/// as the copyWith entrypoint.
/// {@endtemplate}
class _CopyWithConstructor {
  /// {@macro copy_with_constructor}
  const _CopyWithConstructor();
}
