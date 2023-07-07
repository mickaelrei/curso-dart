int somaFor(List<int> numeros) {
  int soma = 0;
  for (int numero in numeros) {
    soma += numero;
  }

  return soma;
}

int somaWhile(List<int> numeros) {
  int soma = 0;
  int i = 0;
  while (i < numeros.length) {
    soma += numeros[i];
    i++;
  }

  return soma;
}

int somaRecursivo(List<int> numeros) {
  // Caso base
  if (numeros.isEmpty) return 0;

  // Retorna o primeiro valor + recursão do resto
  return numeros[0] + somaRecursivo(numeros.sublist(1));
}

int somaMetodo(List<int> numeros) => numeros.reduce((a, b) => a + b);

void main() {
  // Lista de números
  const List<int> numeros = [3, 17, 23, 49, 328, 1358, 21, 429, 12, 103, 20021];

  // Soma com for
  print("for: ${somaFor(numeros)}");

  // Soma com while
  print("while: ${somaWhile(numeros)}");

  // Soma com recursão
  print("recursao: ${somaRecursivo(numeros)}");

  // Soma com métodos de lista
  print("lista: ${somaMetodo(numeros)}");
}
