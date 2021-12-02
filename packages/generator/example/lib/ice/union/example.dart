class Example {
  const Example(this.name) : flag = false;

  const Example.named()
      : name = 'Example',
        flag = true;

  // freezed
  factory Example.factory(String name) = _Example;

  final String name;
  final bool flag;
}

class _Example extends Example {
  _Example(String name) : super(name);
}

void main() {
  final example = Example('name');
  final namedExample = Example.named();

  print(example.name);
  print(namedExample.name);
}
