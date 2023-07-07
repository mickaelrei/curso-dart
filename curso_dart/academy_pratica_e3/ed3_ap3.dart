import 'dart:math';

void main() {
  final random = Random();

  // Cria lista e adiciona valores
  final List<double> raios = [];
  for (int i = 0; i < 10; i++) {
    // Adiciona raio aleatório na lista
    final raio = random.nextDouble() * 99 + 1;
    raios.add(raio);

    // Calcula area e perimetro
    final area = calculaArea(raio);
    final perimetro = calculaArea(raio);

    // Mostra valores
    print("Raio: ${raio.toStringAsFixed(2)},"
        " area: ${area.toStringAsFixed(2)},"
        " perimetro: ${perimetro.toStringAsFixed(2)}");
  }
}

double calculaArea(double raio) {
  return pi * raio * raio;
}

double calculaPerimetro(double raio) {
  return 2 * pi * raio;
}
