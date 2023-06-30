// Classe retângulo
class Retangulo {
  Retangulo(this.largura, this.altura);
  double largura, altura;

  double calcularArea() {
    return largura * altura;
  }
}

void main() {
  // Cria um retângulo
  final retangulo = Retangulo(15.0, 30.0);
  final double area = retangulo.calcularArea();

  // Mostra resultado
  print("Area do retangulo: $area");
}
