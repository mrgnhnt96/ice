import 'package:ice_annotation/src/methods/method.dart';
import 'package:meta/meta_meta.dart';

/// {@template ignore_prop}
/// A property that should be ignored and not be included in
/// the `props` getter.
/// {@endtemplate}
@Target({TargetKind.field})
class IgnoreProp extends Method {
  /// {@macro ignore_prop}
  const IgnoreProp();
}
