import 'package:ice_annotation/src/methods/method.dart';
import 'package:meta/meta_meta.dart';

/// {@template props}
/// Annotation to generate the `props` getter for Equatable classes.
/// {@endtemplate}
@Target({TargetKind.classType})
class Props extends Method {
  /// {@macro props}
  const Props();
}
