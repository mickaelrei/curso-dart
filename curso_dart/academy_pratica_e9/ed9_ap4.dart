/*
Crie uma funcao para "buscar dados".
A funcao deve ser assincrona e mostrar
cada passo da busca como inicio, meio e fim.
*/

void main() async {
  await buscaDados("jogos");
}

Future<void> buscaDados(String busca) async {
  // Simulando conexão
  print("Conectando ao banco de dados...");
  await Future.delayed(Duration(seconds: 3));

  // Iniciando busca
  print("Conectado");

  print("Iniciando busca sobre \"$busca\"...");
  await Future.delayed(Duration(seconds: 2));

  // Busca finalizada
  print("Busca finalizada");
}
