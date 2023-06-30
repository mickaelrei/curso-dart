import 'dart:math';

String intToLetter(int n) {
  // Caractere com código 65 representa a letra A
  return String.fromCharCode(n + 64);
}

void main() {
  final random = Random();

  for (int i = 0; i < 5; i++) {
    final n = random.nextInt(26) + 1;
    print("Numero $n -> Letra ${intToLetter(n)}");
  }
}
