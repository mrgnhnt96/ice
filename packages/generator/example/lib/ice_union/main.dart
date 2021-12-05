import 'package:ice_annotation/ice.dart';

part 'main.ice.dart';
part 'main.g.dart';

@Ice.createUnion
abstract class State {}

@ice
class _$Initial extends State {}

@ice
class _$Ready extends State {}

@ice
class _$Error extends State {}
