import 'package:meta/meta_meta.dart';

/// {@template copywith}
/// Annotation used to mark a class to generate a copyWith method.
/// {@endtemplate}
@Target({TargetKind.classType})
class CopyWith {
  /// {@macro copywith}
  const CopyWith();
}

// /// {@template copywith}
// /// Annotation used to mark a class to generate a copyWith method.
// ///
// /// [_entrypoint] is the constructor of the class that will be used
// /// as the copyWith entrypoint.
// ///
// /// [_entrypoint] defaults to the main constructor.
// /// {@endtemplate}
// class CopyWith {
//   /// {@macro copywith}
//   const CopyWith({String? entrypoint})
//       : _entrypoint = entrypoint ?? '__default__';

//   final String _entrypoint;

//   /// the name of the entrypoint (constructor) to use for the copyWith method
//   String get entrtypoint => _entrypoint;
// }

/// {@template copywith_entrypoint}
/// The constructor of the class that will be used
/// as the copyWith entrypoint.
/// {@endtemplate}
class CopyWithEntryPoint {
  /// {@macro copywith_entrypoint}
  const CopyWithEntryPoint();
}
