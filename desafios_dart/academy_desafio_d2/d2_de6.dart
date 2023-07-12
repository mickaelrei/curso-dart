import 'dart:collection' as collection;

void main() {
  // Instancia de baralho
  final baralho = Baralho();

  // Incluindo cartas
  baralho
    ..empilhar(1, Naipe.paus)
    ..empilhar(1, Naipe.copas)
    ..empilhar(1, Naipe.espadas)
    ..empilhar(1, Naipe.ouros);

  // Removendo cartas
  while (baralho.pilha.isNotEmpty) {
    final String? carta = baralho.remover();
    if (carta != null) {
      print("Carta removida do topo: $carta");
    } else {
      print("O baralho está vazio!");
    }
  }

  // Testando adicionando todo o baralho
  for (int i = 1; i <= 13; i++) {
    for (Naipe naipe in Naipe.values) {
      baralho.empilhar(i, naipe);
    }
  }

  // Mostrando o baralho completo
  print("\nBaralho completo:");
  for (String carta in baralho.pilha) {
    print(carta);
  }
}

class Baralho {
  final collection.Queue<String> pilha = collection.Queue<String>();

  // Metodo que empilha uma carta, recebendo o numero e o naipe
  void empilhar(int numero, Naipe naipe) {
    if (numero < 1 || numero > 13) return;

    // Converte o numero para a string correspondente
    late String prefix;
    switch (numero) {
      case 1:
        prefix = "A";
        break;
      case 11:
        prefix = "J";
        break;
      case 12:
        prefix = "Q";
        break;
      case 13:
        prefix = "K";
        break;
      default:
        prefix = numero.toString();
        break;
    }

    // Converte o naipe para a string correspondente
    late String suffix;
    switch (naipe) {
      case Naipe.paus:
        suffix = "\u2663";
        break;
      case Naipe.copas:
        suffix = "\u2665";
        break;
      case Naipe.espadas:
        suffix = "\u2660";
        break;
      default:
        suffix = "\u2666";
        break;
    }

    // Cria a carta e adiciona no topo do baralho
    String carta = "$prefix$suffix";
    pilha.add(carta);
  }

  // Metodo que retorna a carta no topo do baralho, se nao estiver vazio
  String? remover() {
    if (pilha.isEmpty) return null;

    return pilha.removeLast();
  }
}

// Enum para naipes
enum Naipe { paus, copas, ouros, espadas }
