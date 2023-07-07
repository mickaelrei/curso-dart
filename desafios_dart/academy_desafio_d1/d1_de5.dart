import 'dart:math';

const List<String> nomes = [
  "Ana",
  "Maria",
  "Francisco",
  "Joao",
  "Pedro",
  "Gabriel",
  "Rafaela",
  "Marcio",
  "Jose",
  "Carlos",
  "Patricia",
  "Helena",
  "Camila",
  "Mateus",
  "Gabriel",
  "Samuel",
  "Karina",
  "Antonio",
  "Daniel",
  "Joel",
  "Cristiana",
  "Sebastiao",
  "Paula"
];

const List<String> sobrenomes = [
  "Silva",
  "Souza",
  "Almeida",
  "Azevedo",
  "Braga",
  "Barros",
  "Campos",
  "Cardoso",
  "Costa",
  "Teixeira",
  "Santos",
  "Rodrigues",
  "Ferreira",
  "Alves",
  "Pereira",
  "Lima",
  "Gomes",
  "Ribeiro",
  "Carvalho",
  "Lopes",
  "Barbosa"
];

String geraNome() {
  final random = Random();

  // Pega nome e sobrenome aleatórios
  final String nome = nomes[random.nextInt(nomes.length)];
  final String sobrenome = sobrenomes[random.nextInt(sobrenomes.length)];

  // Retorna o nome completo
  return "$nome $sobrenome";
}

void main() {
  // Gera alguns nomes
  print("Gerando nomes aleatórios:");
  for (int i = 0; i < 7; i++) {
    print(geraNome());
  }
}
