import 'package:ice_annotation/src/methods/method.dart';
import 'package:meta/meta_meta.dart';

/// {@template copywith}
/// Annotation used to mark a class to generate a copyWith method.
/// {@endtemplate}
@Target({TargetKind.classType})
class CopyWith extends Method {
  /// {@macro copywith}
  const CopyWith();

  /// {@macro copywith_entrypoint}
  static const entryPoint = CopyWithEntryPoint();
}

/// {@template copywith_entrypoint}
/// The constructor of the class that will be used
/// as the copyWith entrypoint.
/// {@endtemplate}
class CopyWithEntryPoint {
  /// {@macro copywith_entrypoint}
  const CopyWithEntryPoint();
}
