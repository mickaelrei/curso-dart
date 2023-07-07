import 'dart:math';

num calculaArea(num raio) {
  return pi * raio * raio;
}

num calculaPerimetro(num raio) {
  return 2 * pi * raio;
}

void main() {
  // Lista de raios
  const List<num> raios = [5, 8, 12, 7.3, 18, 2, 25];

  // Pega area e perimetro pra cada raio
  for (num raio in raios) {
    final area = calculaArea(raio);
    final perimetro = calculaPerimetro(raio);

    // Mostra o resultado
    print(
        "Raio: $raio, area: ${area.toStringAsFixed(2)}, perimetro: ${perimetro.toStringAsFixed(2)}");
  }
}
