/*

// map
// maybeMap
// mapOrNull
// when
// maybeWhen
// whenOrNull
// toJson
// fromJson

typedef _Result<R, T extends State> = R Function(T);
typedef _NoResult<R> = R Function();

mixin _$StateUnion {
  R map<R extends Object?>({
    required _Result<R, _Initial> initial,
    required _Result<R, _Ready> ready,
    required _Result<R, _Error> error,
  }) {
    switch (this.runtimeType) {
      case _Initial:
        return initial(this as _Initial);
      case _Ready:
        return ready(this as _Ready);
      case _Error:
        return error(this as _Error);
      default:
        throw UnsupportedError('Unsupported state: $this');
    }
  }

  R maybeMap<R extends Object?>({
    _Result<R, _Initial>? initial,
    _Result<R, _Ready>? ready,
    _Result<R, _Error>? error,
    required _NoResult<R> orElse,
  }) {
    return map(
      initial: (state) => initial?.call(state) ?? orElse(),
      ready: (state) => ready?.call(state) ?? orElse(),
      error: (state) => error?.call(state) ?? orElse(),
    );
  }

  R? mapOrNull<R extends Object?>({
    _Result<R, _Initial>? initial,
    _Result<R, _Ready>? ready,
    _Result<R, _Error>? error,
  }) {
    return map(
      initial: (state) => initial?.call(state),
      ready: (state) => ready?.call(state),
      error: (state) => error?.call(state),
    );
  }

  R when<R extends Object?>({
    required R Function() initial,
    required R Function(String data) ready,
    required R Function(String data, String message, String? fix) error,
  }) {
    return map(
      initial: (state) => initial(),
      ready: (state) => ready(state.data),
      error: (state) => error(state.data, state.message, state.fix),
    );
  }

  R maybeWhen<R extends Object?>({
    R Function()? initial,
    R Function(String data)? ready,
    R Function(String data, String message, String? fix)? error,
    required R Function() orElse,
  }) {
    return map(
      initial: (state) => initial?.call() ?? orElse(),
      ready: (state) => ready?.call(state.data) ?? orElse(),
      error: (state) =>
          error?.call(state.data, state.message, state.fix) ?? orElse(),
    );
  }

  R? whenOrNull<R extends Object?>({
    R Function()? initial,
    R Function(String data)? ready,
    R Function(String data, String message, String? fix)? error,
  }) {
    return map(
      initial: (state) => initial?.call(),
      ready: (state) => ready?.call(state.data),
      error: (state) => error?.call(state.data, state.message, state.fix),
    );
  }

  bool get isInitial => this is _Initial;
  bool get isReady => this is _Ready;
  bool get isError => this is _Error;
}

_$StateUnionFromJson(Map<String, dynamic> json, [State? orElse]) {
  switch (json['runtimeType'] as String?) {
    case '_Initial':
      return _Initial.fromJson(json);
    case '_Ready':
      return _Ready.fromJson(json);
    case '_Error':
      return _Error.fromJson(json);
    default:
      if (orElse != null) return orElse;

      throw UnsupportedError('Unsupported state: $json');
  }
}

Map<String, dynamic> _$StateUnionToJson(State instance) {
  final runtimeTypeMap = <String, dynamic>{};

  return instance.map(
    initial: (initial) => initial.toJson()..addAll(runtimeTypeMap),
    ready: (ready) => ready.toJson()..addAll(runtimeTypeMap),
    error: (error) => error.toJson()..addAll(runtimeTypeMap),
  );
}

// extension $StateX on State {
//   Map<String, dynamic> toJson({bool includeRuntimeType = true}) {
//     final runtimeTypeMap = <String, dynamic>{};

//     if (includeRuntimeType) {
//       runtimeTypeMap['runtimeType'] = '$runtimeType';
//     }

//     return map(
//       initial: (initial) => initial.toJson()..addAll(runtimeTypeMap),
//       ready: (ready) => ready.toJson()..addAll(runtimeTypeMap),
//       error: (error) => error.toJson()..addAll(runtimeTypeMap),
//     );
//   }
// }

*/