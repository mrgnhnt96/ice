// ignore_for_file: implementation_imports

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/element/element.dart';

/// extension on [ElementAnnotation]
extension ElementAnnotationX on ElementAnnotation {
  /// gets the name from [ElementAnnotationImpl]
  String get astName {
    return (this as ElementAnnotationImpl).annotationAst.name.name;
  }

  /// gets [Annotation] from [ElementAnnotationImpl]
  Annotation get ast {
    return (this as ElementAnnotationImpl).annotationAst;
  }
}
