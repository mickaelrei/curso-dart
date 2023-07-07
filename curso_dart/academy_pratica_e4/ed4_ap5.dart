void main() {
  const Map<String, int?> idades = {
    'Nelson': null,
    'Jane': null,
    'Jack': 16,
    'Rupert': 37,
    'Andy': 13,
    'Kim': 27,
    'Robert': 31
  };

  idades.forEach((key, value) {
    print("$key - "
        "${value ?? 'idade nao informada'}");
  });
}
