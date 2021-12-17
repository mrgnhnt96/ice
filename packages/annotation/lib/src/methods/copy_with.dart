import 'package:ice_annotation/src/methods/method.dart';
import 'package:meta/meta_meta.dart';

/// {@template copywith}
/// Annotation used to mark a class to generate a copyWith method.
/// {@endtemplate}
@Target({TargetKind.classType})
class CopyWith extends MethodAnnotation {
  /// {@macro copywith}
  const CopyWith();
}

/// {@template copywith_entrypoint}
/// The constructor of the class that will be used
/// as the copyWith entrypoint.
/// {@endtemplate}
class CopyWithEntryPoint {
  /// {@macro copywith_entrypoint}
  const CopyWithEntryPoint();
}

/// {@template copywith_nullable}
/// Whether the copyWith method should accept nullable types.
/// {@endtemplate}
class CopyWithTypeSafe extends MethodAnnotation {
  /// {@macro copywith_nullable}
  const CopyWithTypeSafe();
}
