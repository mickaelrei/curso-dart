void main() {
  String nome = "Mickael";
  String sobrenome = "Reichert";
  int idade = 19;
  bool ativo = false;
  double peso = 72.3;
  String? nacionalidade = "Brasileiro";

  // Nome completo
  print("Nome completo: $nome $sobrenome");

  // Idade
  if (idade >= 18) {
    print("Idade: $idade (maior de idade)");
  } else {
    print("Idade: $idade (menor de idade)");
  }

  // Ativo
  print("Situacao: ${ativo ? 'Ativo' : 'Inativo'}");

  // Peso
  print("Peso: $peso");

  // Nacionalidade
  if (nacionalidade != null) {
    print("Nacionalidade: $nacionalidade");
  } else {
    print("Nacionalidade: Nao informada");
  }
}
