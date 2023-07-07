import 'dart:math';

void main() {
  final pessoa = Pessoa();

  // Consumindo produtos fornecidos
  for (var i = 0; i < 5; i++) {
    final Fornecedor fornecedor = fornecedorAleatorio();
    pessoa.refeicao(fornecedor);
  }

  pessoa.informacoes();
}

class Produto {
  Produto(this.nome, this.calorias);

  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;
}

// Classe base de fornecedor
class Fornecedor {
  final _random = Random();
  late List<Produto> _produtosDisponiveis;

  Produto fornecer() {
    return _produtosDisponiveis[_random.nextInt(_produtosDisponiveis.length)];
  }
}

// 1 - Novos fornecedores que herdam da classe base Fornecedor
class FornecedorDeBebidas extends Fornecedor {
  final _produtosDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];
}

class FornecedorDeSanduiches extends Fornecedor {
  final _produtosDisponiveis = <Produto>[
    Produto('Misto quente', 290),
    Produto('Sanduiche de presunto', 350),
    Produto('Sanduiche vegano', 300),
    Produto('Sanduiche de ovo', 250)
  ];
}

class FornecedorDeBolos extends Fornecedor {
  final _produtosDisponiveis = <Produto>[
    Produto('Bolo de chocolate', 370),
    Produto('Bolo de cenoura', 415),
    Produto('Bolo de laranja', 190),
    Produto('Bolo de morango', 390),
    Produto('Bolo de bombom', 320),
  ];
}

class FornecedorDeSaladas extends Fornecedor {
  final _produtosDisponiveis = <Produto>[
    Produto('Salada de fruta', 50),
    Produto('Salada de fruta do James', 45),
    Produto('Salada de tomate', 30),
    Produto('Salada de alface', 15),
    Produto('Salada de bombom', 13),
  ];
}

class FornecedorDePetiscos extends Fornecedor {
  final _produtosDisponiveis = <Produto>[
    Produto('Azeitona', 115),
    Produto('Linguicinha', 83),
    Produto('Espetinho', 120),
    Produto('Enrolado de bacon', 313),
    Produto('Ovo de codorna', 160),
  ];
}

class FornecedorDeUltraCaloricos extends Fornecedor {
  final _produtosDisponiveis = <Produto>[
    Produto('Aipim frito', 700),
    Produto('Acaraje', 820),
    Produto('Pizza', 1050),
    Produto('Castanha-do-para', 940),
    Produto('Amendoim', 970),
    Produto('Torresmo', 1250)
  ];
}

class Pessoa {
  // Acumulador de calorias
  int _caloriasConsumidas = 0;

  // 4 - Status da pessoa iniciado aleatoriamente
  NivelCalorias _status =
      NivelCalorias.values[Random().nextInt(NivelCalorias.values.length)];

  // 6 - Numero de refeições realizadas pela pessoa
  int _numRefeicoes = 0;

  /// Imprime as informacoes desse consumidor
  void informacoes() {
    print(
        'Calorias consumidas: $_caloriasConsumidas, Numero de refeicoes: $_numRefeicoes');
  }

  /// Consome um produto e aumenta o numero de calorias
  void refeicao(Fornecedor fornecedor) {
    // 5 - Decide se a pessoa precisa de uma refeição
    if (_status == NivelCalorias.satisfeito) {
      print("A pessoa esta satisfeita.");
      return;
    } else if (_status == NivelCalorias.excesso) {
      print("A pessoa esta com excesso de calorias. Controle suas refeicoes.");
      return;
    }

    final produto = fornecedor.fornecer();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    _caloriasConsumidas += produto.calorias;
    _numRefeicoes++;

    // Atualiza o status de acordo com o nivel de calorias
    if (_caloriasConsumidas <= 500)
      _status = NivelCalorias.deficitExtremo;
    else if (_caloriasConsumidas <= 1800)
      _status = NivelCalorias.deficit;
    else if (_caloriasConsumidas <= 2500)
      _status = NivelCalorias.satisfeito;
    else
      _status = NivelCalorias.excesso;
  }
}

// 2 - Função que retorna um fornecedor aleatório
Fornecedor fornecedorAleatorio() {
  final random = Random();
  final fornecedores = <Fornecedor>[
    FornecedorDeBebidas(),
    FornecedorDeSanduiches(),
    FornecedorDeBolos(),
    FornecedorDeSaladas(),
    FornecedorDePetiscos(),
    FornecedorDeUltraCaloricos()
  ];

  return fornecedores[random.nextInt(fornecedores.length)];
}

// 3 - Niveis de calorias
enum NivelCalorias { deficitExtremo, deficit, satisfeito, excesso }
