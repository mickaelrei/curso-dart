import 'dart:math';

void main() {
  // 7 - Instancia da classe
  final controleItens = ControleItens();

  // Adiciona estoque de itens
  EstoqueItens.adicionarEstoque('Leite', 12);
  EstoqueItens.adicionarEstoque('Banana', 40);
  EstoqueItens.adicionarEstoque('Carne', 15);
  EstoqueItens.adicionarEstoque('Refrigerante', 25);
  EstoqueItens.adicionarEstoque('Arroz', 45);

  // Criando lista de compras
  final listaCompras = <Item>[
    // Itens com estoque
    Item('Leite', 4),
    Item('Banana', 3.5),
    Item('Carne', 2.3),
    Item('Arroz', 50),

    // Itens sem estoque
    Item('Feijao', 2),
  ];

  // Adicionando itens no controle de itens
  listaCompras.forEach(controleItens.adicionarItemDesejado);

  // Marcando itens como comprado
  controleItens
    ..marcarComprado('Leite')
    ..marcarComprado('Carne')
    ..marcarComprado('Arroz');

  // Mostrando itens
  controleItens.imprimirListaDesejos();
}

class Item {
  Item(this.nome, this.quantidade);
  final String nome;
  final double quantidade;

  @override
  String toString() {
    return "Nome: $nome, quantidade: $quantidade";
  }
}

class ControleItens {
  final random = Random();

  // 2 - Separar itens desejados de itens já comprados
  final _itensDesejados = <Item>[];
  final _itensComprados = <Item>[];

  // 1 - Metodo para adicionar um item desejado
  void adicionarItemDesejado(Item item) => _itensDesejados.add(item);

  // Metodo para marcar como comprado
  void marcarComprado(String nomeItem) {
    // Tenta encontrar item na lista de desejos
    final int indexDesejo =
        _itensDesejados.indexWhere((item) => item.nome == nomeItem);

    // Se não foi encontrado, para o processo
    if (indexDesejo == -1) {
      print("O item \"$nomeItem\" nao foi encontrado na lista de desejos.");
      return;
    }

    // Item encontrado, verifica se existe estoque suficiente
    final Item item = _itensDesejados[indexDesejo];
    final double estoque = EstoqueItens.getEstoque(nomeItem);
    if (estoque < item.quantidade) {
      print("Nao ha estoque suficiente para o produto \"$nomeItem\". "
          "Desejado: ${item.quantidade}, existente: $estoque");
      return;
    }

    // Ha estoque, remove da lista de desejos e adiciona na lista de comprados
    print("Item \"$nomeItem\" marcado como comprado com sucesso!");
    _itensDesejados.remove(item);
    _itensComprados.add(item);

    // Diminui estoque
    EstoqueItens.removerEstoque(nomeItem, item.quantidade);
  }

  // 3 - Metodo para pegar uma lista de itens sem estoque
  Iterable<Item> itensSemEstoque() =>
      _itensDesejados.where((item) => EstoqueItens.getEstoque(item.nome) <= 0);

  // 4 - Metodo para exibir itens desejados
  void imprimirListaDesejos() {
    print("Lista de desejos:");
    for (Item item in _itensDesejados) {
      print("\t$item");
    }
  }

  // 5 - Metodo para escolher um item pendente aleatorio
  Item escolherItemPendente() =>
      _itensDesejados[random.nextInt(_itensDesejados.length)];

  // 6 - Metodo que mostra indicador de progresso
  void indicadorProgresso() {
    print("Progresso: ${_itensComprados.length}/${_itensDesejados.length}");
  }
}

// Classe abstrata que cuida do estoque de itens
abstract class EstoqueItens {
  static final Map estoques = <String, double>{};

  // Metodo para pegar estoque
  static double getEstoque(String nomeItem) =>
      estoques.containsKey(nomeItem) ? estoques[nomeItem] : 0;

  // Metodo para adicionar estoque
  static void adicionarEstoque(String nomeItem, double quant) {
    // Se não existe estoque para este item, criar
    if (!estoques.containsKey(nomeItem))
      estoques[nomeItem] = quant;
    else if (quant > 0) estoques[nomeItem] += quant;
  }

  // Metodo para remover estoque
  static void removerEstoque(String nomeItem, double quant) {
    // Se não existe estoque para este item, parar processo
    if (!estoques.containsKey(nomeItem)) return;

    // Verifica se há estoque suficiente
    if (quant <= estoques[nomeItem]) estoques[nomeItem] -= quant;
  }
}
