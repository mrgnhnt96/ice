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
    required this.name,
  });

  /// Retrieves the class data from the element
  factory Class.fromElement(ClassElement element) {
    final constructors = <Constructor>[];
    final params = <Param>[];

    for (final constructor in element.constructors) {
      constructors.add(Constructor.fromElement(constructor));
    }

    return Class(
      constructor: constructors,
      params: params,
      name: element.displayName,
    );
  }

  /// The list of constructors that the [Class] has
  final List<Constructor> constructor;

  /// The list of parameters that the [Class] has
  final List<Param> params;

  /// The name of the [Class]
  final String name;

  /// The entry point to be used to generate the copyWith method
  Constructor entryPoint() {
    if (constructor.isEmpty) {
      throw Exception('No constructor found');
    }

    final entryPoint = constructor.firstWhere(
      (constructor) => constructor.hasEntryPointAnnotation,
      orElse: () => constructor.first,
    );

    return entryPoint;
  }
}
