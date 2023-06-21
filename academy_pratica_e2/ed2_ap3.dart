import 'dart:math';

void main() {
  final random = Random();

  // Cria lista e adiciona valores
  final List<int> lista = [];
  for (int i = 0; i < 50; i++) {
    lista.add(random.nextInt(12) + 10);
  }

  // Mostra lista original
  print("Lista original: ${lista.join(' ; ')}");

  // Lista com valores únicos
  final Set<int> listaUnicos = lista.toSet();

  // Mostra lista com valores únicos
  print("Itens unicos: ${listaUnicos.join(' ; ')}");
}
