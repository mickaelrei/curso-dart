import 'dart:math';

// Definindo classe abstrata
abstract class Calculadora {
  static int dobro(int n) {
    return n * 2;
  }
}

void main() {
  // Gerando número aleatório
  final num = Random().nextInt(501) + 500;

  // Utilizando método
  final int dobro = Calculadora.dobro(num);

  // Imprime
  print("O dobro do numero $num e $dobro");
}
