import 'dart:math';
import 'dart:collection' as collection;

void main() {
  // Instancia de album
  final album = Album();

  // 9 - Adiciona pacotes de figurinhas ate o album estar completo
  while (!album.isCompleto()) {
    // Gera um pacote
    final pacote = PacoteFigurinhas();

    // Adiciona no album
    album.adicionaPacote(pacote);
  }

  // 10 - Imprimir numero de figurinhas repetidas
  print(
      "O album possui ${album.figurinhasRepetidas.length} figurinhas repetidas\n");

  album.imprimirFigurinhas();
}

// 2 - Lista de figurinhas existentes
final figurinhasExistentes = <Figurinha>[
  Figurinha("Leao", 1),
  Figurinha("Girafa", 2),
  Figurinha("Coelho", 3),
  Figurinha("Marmota", 4),
  Figurinha("Gato", 5),
  Figurinha("Cachorro", 6),
  Figurinha("Crocodilo", 7),
  Figurinha("Tucano", 8),
  Figurinha("Falcao", 9),
  Figurinha("Cobra", 10),
  Figurinha("Sapo", 11),
  Figurinha("Rato", 12),
  Figurinha("Papagaio", 13),
  Figurinha("Macaco", 14),
  Figurinha("Gorila", 15),
  Figurinha("Zebra", 16),
  Figurinha("Rinoceronte", 17),
  Figurinha("Elefante", 18),
  Figurinha("Hiena", 19),
  Figurinha("Tigre", 20),
];

// 3 - Classe representando uma figurinha
class Figurinha {
  final String nome;
  final int codigo;

  Figurinha(this.nome, this.codigo);

  @override
  String toString() {
    return "Nome: $nome, codigo: $codigo";
  }
}

// 4 - Classe que armazena figurinhas (repetidas ou nao)
class PacoteFigurinhas {
  final figurinhas = <Figurinha>[];

  PacoteFigurinhas() {
    final random = Random();

    // Adiciona figurinhas aleatorias
    for (int i = 0; i < 4; i++) {
      Figurinha figurinha =
          figurinhasExistentes[random.nextInt(figurinhasExistentes.length)];

      figurinhas.add(figurinha);
    }
  }
}

class Album {
  // 6 - Lista de figurinhas unicas
  final figurinhasUnicas = collection.Queue<Figurinha>();

  // 8 - Lista de figurinhas repetidas
  final figurinhasRepetidas = <Figurinha>[];

  // Metodo para adicionar pacote de figurinhas
  void adicionaPacote(PacoteFigurinhas pacote) {
    for (Figurinha figurinha in pacote.figurinhas) {
      // Verifica se a figurinha ja esta no album
      bool jaInclusa =
          figurinhasUnicas.any((fig) => fig.codigo == figurinha.codigo);

      if (jaInclusa) {
        // Se ja inclusa, adicionar na lista de repetidas
        figurinhasRepetidas.add(figurinha);
      } else {
        // Se nao inclusa, adicionar na lista de unicas
        figurinhasUnicas.add(figurinha);
      }
    }
  }

  // 7 - Metodo que imprime as figurinhas em ordem de codigo
  void imprimirFigurinhas() {
    // Ordena as figuras em conforme o codigo
    final listaFigurinhas = figurinhasUnicas.toList();
    listaFigurinhas.sort((figA, figB) => figA.codigo.compareTo(figB.codigo));

    print("Figurinhas do album"
        " (${figurinhasUnicas.length}"
        "/${figurinhasExistentes.length}):");

    listaFigurinhas.forEach(print);
  }

  // 5 - Metodo que retorna se o album esta completo ou nao
  bool isCompleto() {
    return figurinhasUnicas.length == figurinhasExistentes.length;
  }
}
