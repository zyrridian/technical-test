String lazyCaterer(int n) {
  if (n < 1) return '';

  final terms = <String>[];
  for (var i = 0; i < n; i++) {
    terms.add('${i * (i + 1) ~/ 2 + 1}');
  }
  return terms.join('-');
}

void main() {
  print(lazyCaterer(7));
  print(lazyCaterer(1));
  print(lazyCaterer(10));
}
