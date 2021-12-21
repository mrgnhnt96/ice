/// {@template ice_support}
/// The support needed to generate for all ice classes
/// {@endtemplate}
class IceSupport {
  /// {@macro ice_support}
  factory IceSupport() => _instance ??= IceSupport._();
  IceSupport._();

  static IceSupport? _instance;
  final _support = <String>{};

  /// gets the support and then clears it
  Set<String> get() {
    final support = {..._support};

    _support.clear();

    return support;
  }

  /// adds support
  void add(String support) {
    if (support.isEmpty) return;

    _support.add(support);
  }

  /// adds support
  void addAll(Iterable<String> support) {
    if (support.isEmpty) return;

    _support.addAll(support.where((e) => e.isNotEmpty));
  }
}
