import 'dart:math';

void main() {
  final random = Random();
  int n1 = random.nextInt(100) + 1;
  int n2 = random.nextInt(100) + 1;

  // Mostra valor original
  print("Valores aleatórios:");
  print("N1 = $n1");
  print("N2 = $n2");

  // Inverte valores
  final int temp = n1;
  n1 = n2;
  n2 = temp;

  print("Valores invertidos:");
  print("N1 = $n1");
  print("N2 = $n2");
}
