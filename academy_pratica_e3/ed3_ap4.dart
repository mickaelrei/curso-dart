import 'dart:math';

void imprimeNumeroBases(List<int> lista) {
  // Organiza a lista
  lista.sort();

  // Imprime os valores em diferente bases
  for (int numero in lista) {
    final binario = numero.toRadixString(2);
    final octal = numero.toRadixString(8);
    final hexadec = numero.toRadixString(16);

    print(
        "decimal: $numero, binario: $binario, octal: $octal, hexadecimal: $hexadec");
  }
}

void main() {
  final random = Random();

  // Cria lista
  final List<int> numeros =
      List.generate(15, (index) => random.nextInt(5000) + 1);

  // Imprime números
  imprimeNumeroBases(numeros);
}
