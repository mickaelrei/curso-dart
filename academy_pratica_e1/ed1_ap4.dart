import 'dart:math';

void main() {
  final random = Random();
  final int n1 = random.nextInt(100) + 1;
  final int n2 = random.nextInt(100) + 1;

  // Divisão
  final double divisao = n1 / n2;

  // Parte inteira e decimal
  final int parteInteira = divisao.floor();
  final double parteDecimal = divisao - parteInteira;

  print("Números aleatórios:");
  print("N1 = $n1");
  print("N2 = $n2");

  print("\nDivisão:");
  print("N1 / N2 = $divisao");

  print("\nParte inteira: $parteInteira");
  print("Parte decimal: $parteDecimal");
}
