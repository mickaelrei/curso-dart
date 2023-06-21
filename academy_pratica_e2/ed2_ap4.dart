void main() {
  // Cria mapa de cidades
  final Map<String, List<String>> cidades = {
    'SC': ['Gaspar', 'Blumenau', 'Florianopolis'],
    'PR': ['Curitiba', 'Cascavel', 'Foz do Iguacu'],
    'SP': ['Sao Paulo', 'Guarulhos', 'Campinas'],
    'MG': ['Belo Horizonte', 'Juiz de Fora', 'Berlinda']
  };

  // Mostra a sigla dos estados
  print("Estados: ${cidades.keys.join(' ; ')}");

  // Ordena cidades de SC
  final cidadesSC = cidades['SC']!;
  cidadesSC.sort();

  // Mostra cidades de SC em ordem alfabética
  print("\nCidades de SC: ${cidadesSC.join(' ; ')}\n");

  // Cria lista de cidades com sigla
  final cidadesSigla = [];
  cidades.forEach((sigla, listaCidades) {
    for (String cidade in listaCidades) {
      cidadesSigla.add("$cidade - $sigla");
    }
  });

  // Ordena e mostra
  cidadesSigla.sort();
  print(cidadesSigla.join('\n'));
}
