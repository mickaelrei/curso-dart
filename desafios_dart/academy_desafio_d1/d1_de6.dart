void main() {
  // Lista de números
  final List<int> numeros = [3, 17, 23, 49, 328, 1358, 21, 429, 12, 103, 20021];

  // Mostra os números
  for (int numero in numeros..sort()) {
    String binario = numero.toRadixString(2);
    String octal = numero.toRadixString(8);
    String hexa = numero.toRadixString(16);

    print(
        "decimal: $numero, binario: $binario, octal: $octal, hexadecimal: $hexa");
  }
}
