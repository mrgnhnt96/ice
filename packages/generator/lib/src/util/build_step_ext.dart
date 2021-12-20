import 'package:build/build.dart';
import 'package:ice/src/domain/class.dart';
import 'package:source_gen/source_gen.dart';

/// ext on build step
extension BuildStepX on BuildStep {
  /// gets the current library
  Future<Class> unionClass(String name) async {
    final library = await inputLibrary;
    final libraryReader = LibraryReader(library);
    final result = libraryReader.findType(name);

    if (result == null) {
      throw 'Union type `$name` not found in library `${library.name}`.';
    }

    return Class.fromElement(result);
  }
}
