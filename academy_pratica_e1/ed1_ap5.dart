class Pessoa {
  const Pessoa(this.nome, this.sobrenome, this.idade, this.ativo, this.peso,
      this.nacionalidade);

  final String nome;
  final String sobrenome;
  final int idade;
  final bool ativo;
  final double peso;
  final String? nacionalidade;

  @override
  String toString() {
    String formatado = "";

    // Nome
    formatado += "Nome completo: $nome $sobrenome";

    // Idade
    formatado +=
        "\nIdade: $idade (${idade >= 18 ? 'maior' : 'menor'} de idade)";

    // Ativo
    formatado += "\nSituaçao: ${ativo ? 'Ativo' : 'Inativo'}";

    // Peso
    formatado += "\nPeso: ${peso.toStringAsFixed(2)}";

    // Nacionalidade
    formatado += "\nNacionalidade: ${nacionalidade ?? 'Nao informado'}";

    return formatado;
  }
}

void main() {
  const Pessoa pessoa =
      Pessoa("Mickael", "Reichert", 19, true, 72.3, 'Brasileiro');

  print(pessoa);
}
