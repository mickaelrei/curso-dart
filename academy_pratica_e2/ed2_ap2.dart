import 'dart:math';

void main() {
  final random = Random();

  final List<int> lista = [];

  // Adiciona itens
  for (int i = 0; i < 50; i++) {
    lista.add(random.nextInt(16));
  }

  // Mostra lista original
  print("Lista original: ${lista.join(' ; ')}");

  // Remove pares
  lista.removeWhere((element) => element.isEven);

  // Mostra lista após modificação
  print("Lista atualizada: ${lista.join(' ; ')}");
}
