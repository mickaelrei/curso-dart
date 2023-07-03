import 'dart:math';

enum GeneroMusical {
  trap,
  samba,
  rock,
  pagode,
  funk,
  hiphop,
  rap,
  kpop,
  dubstep
}

void main() {
  final random = Random();

  // Pega um gênero aleatório
  const List<GeneroMusical> generos = GeneroMusical.values;
  final GeneroMusical genero = generos[random.nextInt(generos.length)];

  // Imprime
  print("Meu genero musical preferido e o ${genero.name}");
}
