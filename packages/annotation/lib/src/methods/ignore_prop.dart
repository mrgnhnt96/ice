import 'package:ice_annotation/src/methods/method.dart';
import 'package:meta/meta_meta.dart';

@Target({TargetKind.field})
class IgnoreProp extends Method {
  const IgnoreProp();
}
