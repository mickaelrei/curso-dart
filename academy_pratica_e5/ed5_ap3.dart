import 'dart:math';

int somaPares(int n) {
  int soma = 0;

  // Incrementando de 2 em 2 fará com que apenas os pares
  // sejam adicionados na soma
  for (int i = 2; i <= n; i += 2) {
    soma += i;
  }

  return soma;
}

void main() {
  final random = Random();
  final int n = random.nextInt(901) + 100;
  final int soma = somaPares(n);

  print("A soma dos numeros pares entre 0 e $n e $soma");
}
