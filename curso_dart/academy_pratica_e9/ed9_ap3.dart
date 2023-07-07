void main() async {
  print('Iniciando lancamento');

  // todo: implementar contagem regressiva
  for (int i = 5; i > 0; i--) {
    await contagem(i);
  }

  print('Foguete lancado!');
}

// Função para aguardar 1 segundo
Future<void> contagem(int n) async {
  print("$n...");

  await Future.delayed(Duration(seconds: 1));
}
