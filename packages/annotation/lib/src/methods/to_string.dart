import 'package:ice_annotation/src/methods/method.dart';
import 'package:meta/meta_meta.dart';

/// {@template to_string}
/// Annotation to generate the toString method.
/// {@endtemplate}
@Target({TargetKind.classType})
class ToString extends MethodAnnotation {
  /// {@macro to_string}
  const ToString();
}
