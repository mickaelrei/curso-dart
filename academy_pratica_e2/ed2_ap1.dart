import 'dart:math';

void main() {
  final random = Random();

  // Cria lista
  final List<int> lista = [];

  // Adiciona 10 itens
  for (int i = 0; i < 10; i++) {
    lista.add(random.nextInt(101));

    // Imprime o valor
    print("Posicao: $i, Valor: ${lista[i]}");
  }
}
