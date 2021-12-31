import 'package:meta/meta_meta.dart';

/// ice annotations for fields
@Target({TargetKind.field})
class IceField {
  const IceField._();

  /// does not include the field when generating `props`
  static const ignoreProp = IceField._();
}
