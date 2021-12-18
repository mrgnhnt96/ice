import 'package:ice/src/domain/domain.dart';

/// ext on [Class]
extension ClassXX on Class {
  /// the header for copyWith
  String get copyWithHeader {
    return '$name copyWith';
  }
}

/// ext on [Constructor]
extension ConstructorXX on Constructor {
  /// the params
  Iterable<String> parameters(String Function(Param) callback) {
    return params.map((p) => callback(p));
  }

  /// the args
  Iterable<String> arguments(String Function(Param) callback) {
    return params.map((p) => callback(p));
  }
}
