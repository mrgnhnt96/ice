import 'package:analyzer/dart/constant/value.dart';
import 'package:source_gen/source_gen.dart';

/// ext on enums
extension EnumX on Enum {
  /// gets the value of the enum
  /// from a dart object
  Enum? fromDartObject(DartObject? obj) {
    if (obj == null) {
      return null;
    }

    String getName() => '$this'.split('.').last;

    try {
      final object = obj.getField(getName());

      if (object != null) {
        return this;
      }
    } catch (_) {
      // there was no enum value found
      // continue
    }
  }
}

/// ext on list of enums
extension EnumListX<T extends Enum> on Iterable<T> {
  /// gets the value of the enum
  T? fromReader(ConstantReader reader, String field) {
    final obj = reader.peek(field)?.objectValue;

    for (final item in this) {
      if (item.fromDartObject(obj) != null) {
        return item;
      }
    }
  }
}
