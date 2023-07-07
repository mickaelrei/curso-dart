import 'dart:math';

// Classe base
abstract class Forma {
  double calcularArea();
}

// Classe retângulo
class Retangulo implements Forma {
  // Construtor que verifica dimensões válidas
  Retangulo(double base, double altura) {
    if (base <= 0 || altura <= 0) {
      throw Exception(
          "Dimensoes invalidas, informe apenas valores positivos maiores que zero");
    }

    _base = base;
    _altura = altura;
  }
  late double _base, _altura;

  // Método para cálculo da área
  @override
  double calcularArea() {
    return _base * _altura;
  }
}

void main() {
  final random = Random();

  final double base = random.nextDouble() * 100;
  final double altura = random.nextDouble() * 100;

  try {
    // Tenta criar um retângulo com valores aleatórios
    final retangulo = Retangulo(base, altura);
    final double area = retangulo.calcularArea();
    print("Area do retangulo: ${area.toStringAsFixed(2)}");
  } catch (e) {
    // Em caso e erro, mostra a mensagem
    print(e);
  }
}
