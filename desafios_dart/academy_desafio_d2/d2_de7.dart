import 'dart:collection' as collection;
import 'dart:math';

void main() {
  // Instancia de fila de mercado
  final filaMercado = FilaMercado();

  // Adicionando clientes na fila
  print("\n - Adicionando clientes:");
  for (int i = 0; i < 10; i++) {
    String cliente = GeradorNome.gerarNomeAleatorio();
    filaMercado.adicionarNaFila(cliente);
  }

  // Atendendo os clientes
  print("\n - Atendendo clientes:");
  while (filaMercado.fila.isNotEmpty) {
    filaMercado.atenderProximo();
  }
}

class FilaMercado {
  collection.Queue<String> fila = collection.Queue<String>();

  // Metodo para adicionar uma pessoa na fila
  void adicionarNaFila(String nome) {
    print("$nome entrou na fila");
    fila.add(nome);
  }

  // Metodo para atender proximo cliente
  void atenderProximo() {
    if (fila.isEmpty) {
      print("A fila está vazia");
      return;
    }

    // Atender o primeiro cliente na fila
    String cliente = fila.removeFirst();

    print("$cliente foi atendido(a)");
  }
}

abstract class GeradorNome {
  static const nomes = <String>[
    "Pedro",
    "Joao",
    "Maria",
    "Rodrigo",
    "Juliano",
    "Guilherme",
    "Marcelo",
    "Thiago",
    "Julia",
    "Alice",
    "Brenda"
  ];

  static const sobrenomes = <String>[
    "Silva",
    "Costa",
    "Soares",
    "Correa",
    "Souza",
    "Cordeiro",
    "Santos",
    "Schneider",
    "Pereira",
    "Zanella"
  ];

  static String gerarNomeAleatorio() {
    final random = Random();

    final String nome = nomes[random.nextInt(nomes.length)];
    final String sobrenome = sobrenomes[random.nextInt(sobrenomes.length)];

    return "$nome $sobrenome";
  }
}
