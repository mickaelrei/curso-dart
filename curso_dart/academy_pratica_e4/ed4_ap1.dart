// Anos bissextos são divisíveis por 4, com exceção do primeiro
// ano de cada século (1700, 1800, 1900, etc.), sem incluir anos
// divisíveis por 400 (1200, 1600, 2000, etc.)
bool ehAnoBissexto(int ano) =>
    ano % 400 == 0 || (ano % 100 != 0 && ano % 4 == 0);

void main() {
  // Lista de anos
  const List<int> anos = [2016, 1988, 2000, 2100, 2300, 1993];

  // Mostra se são bissextos ou não
  for (int ano in anos) {
    print("O ano $ano ${ehAnoBissexto(ano) ? '' : 'nao '}eh bissexto");
  }
}
