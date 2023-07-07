class Produto {
  // Construtor e atributos
  Produto(this.nome, this.preco);
  String nome;
  double preco;

  // Método para retornar preço do produto com desconto
  double desconto(double percentualDesconto) {
    return preco * (1 - percentualDesconto / 100);
  }
}

void main() {
  final List<Produto> listaProdutos = [
    Produto("Banana", 4.99),
    Produto("Ameixa", 8.59),
    Produto("Mesa", 120.30),
    Produto("Copo Stanley", 750.99),
    Produto("Espelho", 400.70),
    Produto("TV", 2599.99)
  ];

  const double desconto = 20.0;
  for (Produto prod in listaProdutos) {
    final valorDesconto = prod.desconto(desconto);
    print(
        "Novo preco do produto ${prod.nome} (com desconto de ${desconto.toStringAsFixed(0)}%): R\$ ${valorDesconto.toStringAsFixed(2)}");
  }
}
