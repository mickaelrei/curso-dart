// Classe base
abstract class Arquivo {
  void abrir();
}

class ArquivoTexto implements Arquivo {
  ArquivoTexto(this.nome);

  final String nome;

  // Método que simula abertura de arquivo
  @override
  void abrir() {
    try {
      throw Exception("Erro ao abrir o arquivo $nome");
    } catch (e) {
      rethrow;
    }
  }
}

void main() {
  // Cria instância da classe
  final arquivoTexto = ArquivoTexto("nomes.txt");

  // Tenta abrir o arquivo
  try {
    arquivoTexto.abrir();
  } catch (e) {
    print(e);
  }

  print("Fim do programa");
}
