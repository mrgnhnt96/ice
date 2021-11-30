import 'package:analyzer/dart/element/element.dart';
import 'package:copywith_annotation/copywith.dart';
import 'package:copywith_plus/src/domain/domain.dart';

/// {@template class}
/// The class that [CopyWith] will be generated for
/// {@endtemplate}
class Class {
  /// {@macro constructor}
  const Class({
    required this.constructor,
    required this.params,
  });

  /// The list of constructors that the [Class] has
  final List<Constructor> constructor;

  /// The list of parameters that the [Class] has
  final List<Param> params;

  factory Class.fromElement(ClassElement element) {
    final constructors = <Constructor>[];
    final params = <Param>[];

    for (final constructor in element.constructors) {
      constructors.add(Constructor.fromElement(constructor));
    }

    return Class(
      constructor: constructors,
      params: params,
    );
  }
}
