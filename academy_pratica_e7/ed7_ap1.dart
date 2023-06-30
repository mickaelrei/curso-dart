// Classe simulando conta bancária
class ContaBancaria {
  // Construtor e atributos
  ContaBancaria(this.saldo, this.titular);
  double saldo;
  final String titular;

  void depositar(double quant) {
    saldo += quant;
  }

  // Método sacar que verifica se há saldo suficiente
  void sacar(double quant) {
    if (quant > saldo) {
      print("Nao ha saldo suficiente.");
      return;
    }

    saldo -= quant;
  }
}

void main() {
  // Cria uma conta e faz algumas operações
  final conta = ContaBancaria(1300.0, "Mickael");
  conta.depositar(150.0);
  conta.sacar(700.0);

  print("Saldo atual: ${conta.saldo.toStringAsFixed(2)}");
}
