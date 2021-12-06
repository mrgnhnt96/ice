part of '../basic.dart';

@JsonSerializable()
class _Initial extends _$Initial with EquatableMixin {
  _Initial() : super();

  factory _Initial.fromJson(Map<String, dynamic> json) =>
      _$InitialFromJson(json);

  Map<String, dynamic> toJson() => _$InitialToJson(this);

  @override
  String toString() {
    return '_Initial{}';
  }

  @override
  List<Object?> get props {
    return [];
  }

  _$Initial copyWith() {
    return _Initial();
  }
}

@JsonSerializable()
class _Ready extends _$Ready with EquatableMixin {
  _Ready() : super();

  factory _Ready.fromJson(Map<String, dynamic> json) => _$ReadyFromJson(json);

  Map<String, dynamic> toJson() => _$ReadyToJson(this);

  @override
  String toString() {
    return '_Ready{}';
  }

  @override
  List<Object?> get props {
    return [];
  }

  _$Ready copyWith() {
    return _Ready();
  }
}

@JsonSerializable()
class _Error extends _$Error with EquatableMixin {
  _Error() : super();

  factory _Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  @override
  String toString() {
    return '_Error{}';
  }

  @override
  List<Object?> get props {
    return [];
  }

  _$Error copyWith() {
    return _Error();
  }
}

// TODO: implement toString
