import 'dart:mirrors' as m;

bool hasMember(Type subject, String name) {
  final ref = m.reflectClass(subject);

  final member = ref.instanceMembers[Symbol(name)];

  return member != null;
}

bool hasConstructor(Type subject, String name) {
  final ref = m.reflectClass(subject);

  final member = ref.declarations[Symbol('$subject.$name')];

  return member != null;
}
