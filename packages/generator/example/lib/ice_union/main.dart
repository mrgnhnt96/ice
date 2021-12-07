import 'package:ice_annotation/ice.dart';

part 'main.ice.dart';
part 'main.g.dart';

//! CAUTION:
// when adding super types to ice classes
// we need to make sure that we are extending
// the non-generated class
// example:
/*
@Ice.union
@ice
class $MyClass with _$MyClassUnion {}

! this MUST extend $MyClass, or the code gen will not
! include OtherClass as part of the union
? this happens because MyClase has yet to be generated
? once MyClass has been generated, the next code gen
? should perform as expected
class $OtherClass extends $MyClass {}
 */

@ice
@Ice.union
abstract class $State with _$StateUnion {
  const $State();

  factory $State.fromJson(Map<String, dynamic> json, [State? orElse]) =>
      _$StateUnionFromJson(json, orElse);

  Map<String, dynamic> toJson() => _$StateUnionToJson(this);
}

@ice
class _$Initial extends $State {}

@ice
class _$Ready extends $State {
  const _$Ready(this.data);

  final String data;
}

@ice
class _$Error extends $State {
  const _$Error(
    this.data,
    this.fix,
    this.message,
  );

  final String data, message, fix;
}

void main() {
  final state = _Error('', '', '');

  state.map(
    initial: (initial) {},
    ready: (ready) {},
    error: (error) {},
  );
}
