import 'dart:math' as math;

void main() {
  // Definindo o comparador de formas
  final comparador = ComparadorFormasGeometricas();

  // Definindo as formas geometricas
  final circuloA = Circulo('Circulo A', 3);
  final circuloB = Circulo('Circulo B', 8);
  final retanguloA = Retangulo('Retangulo A', 4, 3);
  final retanguloB = Retangulo('Retangulo B', 19, 11);
  final triEquilA = TrianguloEquilatero('Triangulo Equilatero A', 4);
  final triEquilB = TrianguloEquilatero('Triangulo Equilatero A', 6);
  final hexagonoA = HexagonoRegular('Hexagono Regular A', 5);
  final hexagonoB = HexagonoRegular('Hexagono B', 2.5);

  final circuloMaiorArea = comparador.formaDeMaiorArea(circuloA, circuloB);
  final retanguloMaiorArea = comparador.formaDeMaiorArea(
    retanguloA,
    retanguloB,
  );

  if (circuloMaiorArea.area > retanguloMaiorArea.area) {
    print(
      'A maior area e ${circuloMaiorArea.area.toStringAsFixed(2)} '
      'e pertence a ${circuloMaiorArea.nome}',
    );
  } else {
    print(
      'A maior area e ${retanguloMaiorArea.area.toStringAsFixed(2)} '
      'e pertence a ${retanguloMaiorArea.nome}',
    );
  }

  final circuloMaiorPerimetro = comparador.formaDeMaiorPerimetro(
    circuloA,
    circuloB,
  );
  final retanguloMaiorPerimetro = comparador.formaDeMaiorPerimetro(
    retanguloA,
    retanguloB,
  );
  if (circuloMaiorPerimetro.area > retanguloMaiorPerimetro.area) {
    print(
      'O maior perimetro e ${circuloMaiorPerimetro.perimetro.toStringAsFixed(2)} '
      'e pertence a ${circuloMaiorPerimetro.nome}',
    );
  } else {
    print(
      'O maior perimetro e ${retanguloMaiorPerimetro.perimetro.toStringAsFixed(2)} '
      'e pertence a ${retanguloMaiorPerimetro.nome}',
    );
  }

  // Testes com triangulos equilateros
  final trianguloMaiorArea = comparador.formaDeMaiorArea(triEquilA, triEquilB);
  final trianguloMaiorPerimetro =
      comparador.formaDeMaiorPerimetro(triEquilA, triEquilB);
  print("O triangulo de maior area e ${trianguloMaiorArea.nome}, "
      "com area de ${trianguloMaiorArea.area.toStringAsFixed(2)}");
  print("O triangulo de maior perimetro e ${trianguloMaiorPerimetro.nome}, "
      "com perimetro de ${trianguloMaiorPerimetro.perimetro.toStringAsFixed(2)}");

  // Testes com hexagonos regulares
  final hexMaiorArea = comparador.formaDeMaiorArea(hexagonoA, hexagonoB);
  final hexMaiorPerimetro =
      comparador.formaDeMaiorPerimetro(hexagonoA, hexagonoB);
  print("O hexagono de maior area e ${hexMaiorArea.nome}, "
      "com area de ${hexMaiorArea.area.toStringAsFixed(2)}");
  print("O hexagono de maior perimetro e ${hexMaiorPerimetro.nome}, "
      "com perimetro de ${hexMaiorPerimetro.perimetro.toStringAsFixed(2)}");
}

// 1 - Classe base Forma
abstract class Forma {
  Forma(this.nome);

  // Atributo em comum para todas as formas
  final String nome;

  // Getters
  // 2 - Cada classe implementa sua própria versão de getter para area e perimetro
  double get area;
  double get perimetro;
}

/// Representa a forma geometrica "circulo"
class Circulo extends Forma {
  /// Construtor padrao, recebe o [raio] do circulo.
  Circulo(super.nome, this.raio);

  final double raio;

  /// Retorna a area desse circulo
  @override
  double get area => math.pi * math.pow(raio, 2);

  /// Retorna o perimetro desse circulo
  @override
  double get perimetro => 2 * math.pi * raio;
}

/// Representa a forma geometrica "retangulo", forma geometrica de quatro lados
/// e angulos retos (90 graus).
class Retangulo extends Forma {
  /// Construtor padrao, recebe a [altura] e [largura] do retangulo
  Retangulo(super.nome, this.altura, this.largura);

  final double largura;
  final double altura;

  /// Retorna a area desse circulo
  @override
  double get area => altura * largura;

  /// Retorna o perimetro desse circulo
  @override
  double get perimetro => (altura * 2) + (largura * 2);
}

/// Representa a forma geometrica "quadrado", que e um formato especial de
/// retangulo, onde todos os lados possuem o mesmo tamanho.
class Quadrado extends Retangulo {
  /// Construtor padrao, recebe o [lado] do quadrado
  Quadrado(String nome, double lado) : super(nome, lado, lado);

  // Retorna o lado
  double get lado => altura;

  /// Retorna a area desse quadrado
  @override
  double get area => lado * lado;

  /// Retorna o perimetro desse quadrado
  @override
  double get perimetro => lado * 4;
}

/// 4 - Representa a forma geometrica "Triangulo equilatero", que e um
/// formato especial de triangulo, onde todos os lados possuem o mesmo tamanho.
class TrianguloEquilatero extends Forma {
  /// Construtor padrao, recebe o [lado] do triangulo
  TrianguloEquilatero(super.nome, this.lado);

  double lado;

  /// Retorna a altura desse triangulo
  double get altura => lado * math.sqrt(3) * 0.5;

  /// Retorna a area desse triangulo
  @override
  double get area => lado * altura * 0.5;

  /// Retorna o perimetro desse triangulo
  @override
  double get perimetro => lado * 3;
}

/// 5 - Representa a forma geometrica "Triangulo retangulo", que e um
/// formato especial de triangulo, onde um dos angulo internos equivale a 90°.
class TrianguloRetangulo extends Forma {
  /// Construtor padrao, recebe o [lado] do triangulo
  TrianguloRetangulo(super.nome, this.catetoA, this.catetoB, this.hipotenusa);

  double catetoA, catetoB;
  double hipotenusa;

  /// Retorna a area desse triangulo
  @override
  double get area => catetoA * catetoB * 0.5;

  /// Retorna o perimetro desse triangulo
  @override
  double get perimetro => catetoA + catetoB + hipotenusa;
}

/// 6 - Representa a forma geometrica "Pentagono regular", que e um
/// formato especial de pentagono, onde todos os lados medem o mesmo tamanho.
class PentagonoRegular extends TrianguloEquilatero {
  PentagonoRegular(super.nome, super.lado);

  /// Retorna a area desse triangulo
  /// Um pentagono regular pode ser pensado como 5 triangulos equilateros,
  /// portanto sua area é equivalente a 5 vezes a area desse triangulo
  @override
  double get area => super.area * 5;

  /// Retorna o perimetro desse triangulo
  @override
  double get perimetro => lado * 5;
}

/// 7 - Representa a forma geometrica "Hexagono regular", que e um
/// formato especial de hexagono, onde todos os lados medem o mesmo tamanho.
class HexagonoRegular extends TrianguloEquilatero {
  HexagonoRegular(super.nome, super.lado);

  /// Retorna a area desse triangulo
  /// Um pentagono regular pode ser pensado como 6 triangulos equilateros,
  /// portanto sua area é equivalente a 6 vezes a area desse triangulo
  @override
  double get area => super.area * 6;

  /// Retorna o perimetro desse triangulo
  @override
  double get perimetro => lado * 6;
}

/// Compara caracteristicas de formas geometricas
/// 2 - Classe comparadora possui somente um método para verificar area e
/// outro para verificar perimetro
class ComparadorFormasGeometricas {
  /// Retorna a forma com a maior area, ou [formaA] caso as areas sejam
  /// iguais
  Forma formaDeMaiorArea(Forma formaA, Forma formaB) {
    if (formaA.area > formaB.area) {
      return formaA;
    } else if (formaB.area > formaA.area) {
      return formaB;
    }
    return formaA;
  }

  /// Retorna a forma com o maior perimetro, ou [formaA] caso os perimetros
  /// sejam iguais
  Forma formaDeMaiorPerimetro(Forma formaA, Forma formaB) {
    if (formaA.perimetro > formaB.perimetro) {
      return formaA;
    } else if (formaB.perimetro > formaA.perimetro) {
      return formaB;
    }
    return formaA;
  }
}
