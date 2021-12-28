import 'package:analyzer/dart/element/element.dart';

///
class DoNotGenerate {
  ///
  const DoNotGenerate({
    required this.tostring,
    required this.copyWith,
    required this.fromJsonConstructor,
    required this.equatable,
  });

  /// sets all do not generate flags to false
  const DoNotGenerate.none()
      : this(
          tostring: false,
          copyWith: false,
          fromJsonConstructor: false,
          equatable: false,
        );

  /// checks the [element] for any constructors or methods that
  /// already exist
  factory DoNotGenerate.fromElement(ClassElement element) {
    var toString = false;
    var copyWith = false;
    var fromJsonConstructor = false;
    var props = false;

    // isSynthetic == getter
    for (final field in element.fields.where((e) => e.isSynthetic)) {
      if (field.name == 'props') {
        props = true;
      }

      if (props) {
        break;
      }
    }

    for (final method in element.methods) {
      if (method.name == 'toString') {
        toString = true;
      } else if (method.name == 'copyWith') {
        copyWith = true;
      }

      if (toString && copyWith) {
        break;
      }
    }

    for (final ctor in element.constructors) {
      if (ctor.name == 'fromJson') {
        fromJsonConstructor = true;
      }

      if (fromJsonConstructor) {
        break;
      }
    }

    return DoNotGenerate(
      tostring: toString,
      copyWith: copyWith,
      fromJsonConstructor: fromJsonConstructor,
      equatable: props,
    );
  }

  /// Whether to generate toString()
  final bool tostring;

  /// Whether to generate copyWith()
  final bool copyWith;

  /// Whether to generate fromJson()
  final bool fromJsonConstructor;

  /// Whether to generate props
  final bool equatable;
}
