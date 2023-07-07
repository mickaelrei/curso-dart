// Classe abstrata com métodos padrão
abstract class Animal {
  void comer() {
    print("O animal esta comendo.");
  }

  void beber() {
    print("O animal esta bebendo.");
  }
}

// Classe que herda de Animal
class Pato extends Animal {
  // Definindo método único da classe Pato
  void grasnar() {
    print("quack quack");
  }
}

void main() {
  // Instância de Pato
  final Pato pato = Pato();

  // Chamada de métodos
  pato.beber();
  pato.comer();
  pato.grasnar();
}
