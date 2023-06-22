import 'dart:math';

num funcaoA(num Function(num) f) {
  final random = Random();
  final resultadoA = f(random.nextInt(101));
  final resultadoB = f(random.nextInt(101));

  return resultadoA + resultadoB;
}

num funcaoB(num numero) {
  return numero * 2;
}

num funcaoC(num numero) {
  return -numero;
}

void main() {
  // Pega resultados
  final resultado1 = funcaoA(funcaoB);
  final resultado2 = funcaoA(funcaoC);

  // Mostra valores
  print("A(B) = $resultado1");
  print("A(C) = $resultado2");
}
