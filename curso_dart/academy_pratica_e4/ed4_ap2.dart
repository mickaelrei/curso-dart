List<int> toNumbers(List<String> list) {
  // Cria lista vazia
  List<int> numbers = [];

  // Adiciona número para cada item
  for (String item in list) {
    // Converte para número
    final int num = int.tryParse(item) ?? 0;

    // Adiciona na lista
    numbers.add(num);
  }

  return numbers;
}

void main() {
  // Lista de strings
  const List<String> listaStrings = [
    '10',
    '2XXL7',
    'JOJ0',
    '99',
    '381',
    'AD44',
    '47',
    '2B',
    '123',
    '78'
  ];

  // Pega lista convertida para números
  final List<int> listaNumeros = toNumbers(listaStrings);

  // Mostra
  print("Lista convertida: ${listaNumeros.join(', ')}");
}
