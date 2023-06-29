// Função que tenta remover um item
List removeItem({List? lista, dynamic elemento}) {
  lista?.remove(elemento);

  return lista ?? [];
}

void main() {
  final List<String> nomes = [
    "João",
    "Roberto",
    "Mickael",
    "Guilherme",
    "Rafael",
    "Josefina",
    "Luiza"
  ];

  // Remove um item
  final novaLista = removeItem(
    lista: nomes,
    elemento: "Roberto",
  );

  // Mostra lista após remoção
  for (String item in novaLista) {
    print("Item: $item");
  }
}
