Future<void> main() async {
  List<String> urls = [
    'https://example.com/imagem1.jpg',
    'https://example.com/imagem2.jpg',
    'https://example.com/imagem3.jpg',
  ];

  await baixarImagens(urls);
}

// Função para baixar lista de imagens
Future<void> baixarImagens(List<String> urls) async {
  print("Baixando imagens...");

  // Baixa cada imagem
  for (String url in urls) {
    await baixarImagem(url);
  }

  print("Download concluido!");
}

// Função para baixar imagem
Future<void> baixarImagem(String url) async {
  // Simula o tempo para baixar a imagem
  await Future.delayed(Duration(seconds: 2));

  print("Imagem $url baixada com sucesso!");
}
