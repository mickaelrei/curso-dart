import 'dart:math';

void main() {
  final random = Random();

  // Cria listas A e B
  final List<int> listaA = [];
  final List<int> listaB = [];

  // Adiciona números aleatórios
  for (int i = 0; i < 5; i++) {
    listaA.add(random.nextInt(101));
    listaB.add(random.nextInt(101));
  }

  // Imprime as listas
  imprimeLista(listaA);
  imprimeLista(listaB);

  // Cria a lista dos itens somados
  List<int> listaSoma = somaItens(listaA, listaB);

  // Imprime a lista de somados
  imprimeLista(listaSoma);
}

void imprimeLista(List<int> lista) {
  if (lista.length > 0) {
    print("Lista: ${lista.join(', ')}");
  } else {
    print("Lista vazia");
  }
}

List<int> somaItens(List<int> listaA, List<int> listaB) {
  // Se as listas tiverem tamanho diferente, retorna lista vazia
  if (listaA.length != listaB.length) {
    return [];
  }

  // Cria lista de soma
  List<int> listaSoma = [];
  for (int i = 0; i < listaA.length; i++) {
    // Valores
    final valorA = listaA[i];
    final valorB = listaB[i];

    // Mostra ação
    print("$valorA+$valorB");

    // Adiciona na lista de soma
    listaSoma.add(valorA + valorB);
  }

  return listaSoma;
}
