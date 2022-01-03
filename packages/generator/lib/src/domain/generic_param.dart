import 'package:analyzer/dart/element/element.dart';

///
class GenericParam {
  ///
  const GenericParam({
    required this.name,
    required this.declaration,
    required this.extendsType,
  });

  /// the name of the generic parameter
  final String name;

  /// the declaration of the generic parameter
  final String declaration;

  /// the type that extends the generic parameter
  final String? extendsType;

  /// gets the generic param from [TypeParameterElement]
  factory GenericParam.fromElement(TypeParameterElement element) {
    final name = element.name;
    final declaration = '$element';
    final extendsType = element.bound?.getDisplayString(withNullability: true);

    return GenericParam(
      name: name,
      declaration: declaration,
      extendsType: extendsType,
    );
  }
}
