int percentualDesconto(double valorOriginal, double valorDescontado) {
  return 100 - (valorDescontado ~/ valorOriginal * 100);
}

void main() {
  // Inicia valor original e valor descontado
  const double valorOriginal = 10;
  const double valorDescontado = 7;

  // Pega o percentual de desconto
  final int desconto = percentualDesconto(valorOriginal, valorDescontado);

  // Imprime desconto
  print(
      "O produto custava R\$ ${valorOriginal.toStringAsFixed(2)} e foi vendido por R\$ ${valorDescontado.toStringAsFixed(2)}, portanto o desconto dado foi $desconto%.");
}
