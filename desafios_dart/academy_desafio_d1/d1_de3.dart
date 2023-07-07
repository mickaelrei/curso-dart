const String vogais = "aeiou";

Map<String, dynamic> informacoesParagrafo(String paragrafo) {
  // Iniciando o Map de informações
  final Map<String, dynamic> informacoes = {};

  // Número de palavras
  informacoes["numPalavras"] = paragrafo.split(" ").length;

  // Tamanho do texto
  informacoes["tamanho"] = paragrafo.length;

  // Número de frases
  informacoes["numFrases"] = paragrafo.split(".").length;

  // Número de vogais
  informacoes["numVogais"] = 0;
  for (int i = 0; i < paragrafo.length; i++) {
    if (vogais.contains(paragrafo[i].toUpperCase())) informacoes["numVogais"]++;
  }

  // Consoantes presentes no parágrafo
  informacoes["consoantes"] = <String>{};
  for (int i = 0; i < paragrafo.length; i++) {
    // Pega o caractere e o código dele
    final String char = paragrafo[i].toLowerCase();
    final int code = char.codeUnitAt(0);

    // Verifica se é uma letra maiúscula e não é uma vogal
    if (code >= 97 && code <= 122 && !vogais.contains(char))
      informacoes["consoantes"].add(char);
  }

  // Ordena a lista de consoantes
  informacoes["consoantes"] = informacoes["consoantes"].toList();
  informacoes["consoantes"].sort();

  return informacoes;
}

int contarPalavras(String paragrafo) {
  // Verifica se a string tem apenas caracteres de espaço
  if (paragrafo.trim().length == 0) return 0;

  return paragrafo.split(" ").length;
}

int tamanhoParagrafo(String paragrafo) => paragrafo.trim().length;

int numeroFrases(String paragrafo) {
  int numFrases = 0;

  // Removendo caracteres de espaço no começo e fim, separa por ponto .
  for (String frase in paragrafo.trim().split(".")) {
    // Aumenta somente se for uma string não vazia
    if (frase.isNotEmpty) numFrases++;
  }

  return numFrases;
}

int numeroVogais(String paragrafo) {
  int numVogais = 0;

  for (int i = 0; i < paragrafo.length; i++) {
    // Verifica se é um caractere presente na string de vogais
    if (vogais.contains(paragrafo[i].toLowerCase())) numVogais++;
  }

  return numVogais;
}

List<String> listaConsoantes(String paragrafo) {
  final consoantes = <String>{};

  for (int i = 0; i < paragrafo.length; i++) {
    // Pega o caractere e o código dele
    final String char = paragrafo[i].toLowerCase();
    final int code = char.codeUnitAt(0);

    // Letras minúsculas têm código entre 97 e 122
    if (code >= 97 && code <= 122 && !vogais.contains(char))
      consoantes.add(char);
  }

  return (consoantes.toList())..sort();
}

void main() {
  // Parágrafo de entrada
  const String paragrafo =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis nunc et posuere vehicula. Mauris lobortis quam id lacinia porttitor.";

  // Mostra informações
  print("Paragrafo: $paragrafo");
  print("Numero de palavras: ${contarPalavras(paragrafo)}");
  print("Tamanho do texto: ${tamanhoParagrafo(paragrafo)}");
  print("Numero de frases: ${numeroFrases(paragrafo)}");
  print("Numero de vogais: ${numeroVogais(paragrafo)}");
  print("Consoantes encontradas: ${listaConsoantes(paragrafo).join(', ')}");
}
