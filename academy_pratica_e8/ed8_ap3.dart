// Classe abstrata
abstract class Pessoa {
  void pular();
}

// Classe abstrata
abstract class Funcionario {
  void trabalhar();
}

// Classe concreta que implementa as duas abstratas
class OperadorCaixa implements Pessoa, Funcionario {
  // Definindo métodos
  void pular() {
    print("O operador de caixa esta pulando.");
  }

  void trabalhar() {
    print("O operador de caixa esta trabalhando.");
  }
}

void main() {
  // Instância de OperadorCaixa
  final operador = OperadorCaixa();

  // Chamando métodos
  operador.pular();
  operador.trabalhar();
}
