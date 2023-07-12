void main() {
  // Mostrando musicas
  BibliotecaMusicas.imprimir();

  // Numero de musicas
  print(
      "\nNumero de musicas presentes na biblioteca: ${BibliotecaMusicas.musicas.length}");

  // Tempo total em horas
  int totalSegundos = 0;
  // Soma total de segundos
  BibliotecaMusicas.musicas
      .forEach((musica) => totalSegundos += musica.duracaoSegundos);

  // Calcula e mostra o total de horas
  double totalHoras = totalSegundos / 3600;
  print(
      "Tempo total, em horas, das musicas da biblioteca: ${totalHoras.toStringAsFixed(2)}\n");

  // Realiza buscas
  // Por titulo
  final String titulo = "Billie Jean";
  final buscaTitulo = BibliotecaMusicas.buscaPorTitulo(titulo);

  if (buscaTitulo.isNotEmpty) {
    print("Musicas encontradas na busca por titulo \"$titulo\":");
    buscaTitulo.forEach(print);
  } else {
    print("Nenhum resultado para busca por titulo \"$titulo\".");
  }

  // Por album
  final String album = "Thriller";
  final buscaAlbum = BibliotecaMusicas.buscaPorAlbum(album);

  if (buscaAlbum.isNotEmpty) {
    print("\nMusicas encontradas na busca por album \"$album\":");
    buscaAlbum.forEach(print);
  } else {
    print("\nNenhum resultado para busca por album \"$album\".");
  }

  // Por artista
  final String artista = "Katy Perry";
  final buscaArtista = BibliotecaMusicas.buscaPorArtista(artista);

  if (buscaArtista.isNotEmpty) {
    print("\nMusicas encontradas na busca por artista \"$artista\":");
    buscaArtista.forEach(print);
  } else {
    print("\nNenhum resultado para busca por artista \"$artista\".");
  }

  // Adiciona uma musica
  Musica novaMusica = Musica("Bad Romance", "Lady Gaga", "Bad Romance", 300);
  BibliotecaMusicas.adicionarMusica(novaMusica);
}

class Musica {
  Musica(this.titulo, this.artista, this.album, this.duracaoSegundos);
  String titulo;
  String artista;
  String album;
  int duracaoSegundos;

  @override
  String toString() {
    return "Titulo: $titulo, nome do artista: $artista, nome do album: $album, duracao: ${duracaoSegundos}s";
  }
}

abstract class BibliotecaMusicas {
  static final musicas = <Musica>[
    Musica("Billie Jean", "Michael Jackson", "Thriller", 296),
    Musica("Smooth Criminal", "Michael Jackson", "Bad 25", 257),
    Musica("Beat It", "Michael Jackson", "Thriller", 258),
    Musica("Ela partiu", "Tim Maia", "Tim Maia e Convidados", 256),
    Musica("Gostava tanto de você", "Tim Maia", "Tim Maia", 256),
    Musica("Descobridor dos sete mares", "Tim Maia",
        "O Descobridor dos Sete Mares", 265),
    Musica("Dark Horse", "Katy Perry", "Prism", 215),
    Musica("E.T", "Katy Perry", "Teenage Dream", 231),
    Musica("Hot N Cold", "Katy Perry", "One of the Boys", 200),
  ];

  static void imprimir() {
    print("Musicas disponiveis:");
    musicas.forEach(print);
  }

  static void adicionarMusica(Musica musica) {
    musicas.add(musica);
    print("Musica adicionada a biblioteca!");
  }

  // Retorna a primeira musica com o mesmo titulo, ou null se não encontrar nenhuma
  static Iterable<Musica> buscaPorTitulo(String titulo) =>
      musicas.where((musica) => musica.titulo.contains(titulo));

  // Retorna uma lista de musicas do artista passado como parametro
  static Iterable<Musica> buscaPorArtista(String artista) =>
      musicas.where((musica) => musica.artista.contains(artista));

  // Retorna uma lista de musicas presentes no album passado
  static Iterable<Musica> buscaPorAlbum(String album) =>
      musicas.where((musica) => musica.album.contains(album));
}
