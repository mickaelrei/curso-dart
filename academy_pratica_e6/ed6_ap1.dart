void stringToInt(String s) {
  try {
    final int numero = int.parse(s);
    print("Numero digitado: $numero");
  } catch (e) {
    print("Entrada invalida. Digite apenas numeros inteiros.");
  }
}

void main() {
  // Nenhum erro, número válido
  stringToInt('123');

  // Número inválido
  stringToInt('texto');
}
