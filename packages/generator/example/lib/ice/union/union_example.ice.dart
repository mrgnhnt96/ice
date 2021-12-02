part of 'main.dart';

/*
  Each class will have its own
    - copyWith
    - toString
    - json_serializable
    - equals
    - hashCode
    ? include equatable
*/

@JsonSerializable()
class Initial extends _$Initial with EquatableMixin {
  const Initial() : super();

  factory Initial.fromJson(Map<String, dynamic> json) =>
      _$InitialFromJson(json);

  Map<String, dynamic> _toJson() => _$InitialToJson(this);

  @override
  List<Object?> get props => [];
}

@JsonSerializable()
class _Ready extends _$Ready with EquatableMixin {
  const _Ready(String data) : super(data);

  factory _Ready.fromJson(Map<String, dynamic> json) => _$ReadyFromJson(json);

  Map<String, dynamic> _toJson() => _$ReadyToJson(this);

  @override
  List<Object?> get props => [data];
}

@JsonSerializable()
class _Error extends _$Error with EquatableMixin {
  _Error(
    String data, {
    required String message,
    String? fix,
  }) : super(
          data,
          message: message,
          fix: fix,
        );

  factory _Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> _toJson() => _$ErrorToJson(this);

  @override
  List<Object?> get props => [data, message, fix];
}

extension InitialX on Initial {
  Initial copyWith() => Initial();
}

extension ReadyX on _Ready {
  _Ready copyWith() => _Ready('');
}

extension ErrorX on _Error {
  _Error copyWith() => _Error('', message: '', fix: '');
}

typedef _Result<R, T extends State> = R Function(T);
typedef _NoResult<R> = R Function();

extension StateX on State {
  T map<T extends Object?>({
    required _Result<T, Initial> initial,
    required _Result<T, _Ready> ready,
    required _Result<T, _Error> error,
  }) {
    switch (this.runtimeType) {
      case Initial:
        return initial(this as Initial);
      case _Ready:
        return ready(this as _Ready);
      case _Error:
        return error(this as _Error);
      default:
        throw UnsupportedError('Unsupported state: $this');
    }
  }

  T maybeMap<T extends Object?>({
    _Result<T, Initial>? initial,
    _Result<T, _Ready>? ready,
    _Result<T, _Error>? error,
    required _NoResult<T> orElse,
  }) {
    return map(
      initial: (state) => initial?.call(state) ?? orElse(),
      ready: (state) => ready?.call(state) ?? orElse(),
      error: (state) => error?.call(state) ?? orElse(),
    );
  }

  T? mapOrNull<T extends Object?>({
    _Result<T, Initial>? initial,
    _Result<T, _Ready>? ready,
    _Result<T, _Error>? error,
  }) {
    return map(
      initial: (state) => initial?.call(state),
      ready: (state) => ready?.call(state),
      error: (state) => error?.call(state),
    );
  }

  T when<T extends Object?>({
    required T Function() initial,
    required T Function(String data) ready,
    required T Function(String data, String message, String? fix) error,
  }) {
    return map(
      initial: (state) => initial(),
      ready: (state) => ready(state.data),
      error: (state) => error(state.data, state.message, state.fix),
    );
  }

  T maybeWhen<T extends Object?>({
    T Function()? initial,
    T Function(String data)? ready,
    T Function(String data, String message, String? fix)? error,
    required T Function() orElse,
  }) {
    return map(
      initial: (state) => initial?.call() ?? orElse(),
      ready: (state) => ready?.call(state.data) ?? orElse(),
      error: (state) =>
          error?.call(state.data, state.message, state.fix) ?? orElse(),
    );
  }

  T? whenOrNull<T extends Object?>({
    T Function()? initial,
    T Function(String data)? ready,
    T Function(String data, String message, String? fix)? error,
  }) {
    return map(
      initial: (state) => initial?.call(),
      ready: (state) => ready?.call(state.data),
      error: (state) => error?.call(state.data, state.message, state.fix),
    );
  }

  Map<String, dynamic> toJson({bool includeRuntimeType = true}) {
    final runtimeTypeMap = <String, dynamic>{};

    if (includeRuntimeType) {
      runtimeTypeMap['runtimeType'] = '$runtimeType';
    }

    return map(
      initial: (initial) => initial._toJson()..addAll(runtimeTypeMap),
      ready: (ready) => ready._toJson()..addAll(runtimeTypeMap),
      error: (error) => error._toJson()..addAll(runtimeTypeMap),
    );
  }
}

State _$StateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String?) {
    case 'Initial':
      return Initial.fromJson(json);
    case '_Ready':
      return _Ready.fromJson(json);
    case '_Error':
      return _Error.fromJson(json);
    default:
      throw UnsupportedError('Unsupported state: $json');
  }
}
