List<int> listaImpares(int max) {
  final List<int> lista = [];
  int c = 0;

  while (c < max) {
    if (c.isOdd) {
      lista.add(c);
    }

    c++;
  }

  return lista;
}

void main() {
  // Pega lista
  final lista = listaImpares(10);

  // Imprime valores
  for (int n in lista) {
    print("Impar: $n");
  }
}
