import 'dart:math';

class Pessoa {
  Pessoa(this.nome, this._idade, this.altura);
  final String nome;
  int _idade;
  final double altura;

  // Setter para idade
  void set idade(int idade) {
    if (idade <= 0) {
      print("A idade precisa ser um número inteiro maior que zero.");
      return;
    }

    this._idade = idade;
  }

  // Getter para idade
  int get idade => this._idade;
}

void main() {
  final random = Random();

  // Gera idade e altura aleatoriamente
  final int idade = random.nextInt(100) + 1;
  final double altura = random.nextDouble() * 1.3 + 1;

  // Cria instância de pessoa
  Pessoa pessoa = Pessoa("João", idade, altura);

  // Utiliza os getters e setters
  pessoa.idade = 18;
  pessoa.idade = -15;

  print("Nome: ${pessoa.nome}");
  print("Idade: ${pessoa.idade}");
  print("Altura: ${pessoa.altura.toStringAsFixed(2)}");
}
