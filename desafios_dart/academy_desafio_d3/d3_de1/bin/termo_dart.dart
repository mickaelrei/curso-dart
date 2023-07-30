import 'dart:math';
import 'dart:io' as io;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<void> main() async {
  // Instancia da classe
  final game = await TermoGame.instance();

  // Loop de jogo
  while (true) {
    // Iniciar termo
    print("\nIniciando Termo:");
    game.termo();

    // Após finalizado, iniciar dueto
    if (!askUser("Continuar para o Dueto?")) break;

    print("\nIniciando Dueto:");
    game.dueto();

    // Após finalizado, iniciar quarteto
    if (!askUser("Continuar para o Quarteto?")) break;

    print("\nIniciando Quarteto:");
    game.quarteto();

    if (!askUser("Continuar para o Octeto?")) break;

    print("\nIniciando Octeto:");
    game.custom(numJogos: 8);

    // Pergunta se quer continuar
    if (!askUser("Continuar para o Termo:")) break;
  }
}

class ColorPrint {
  static String black(String text) => '\x1B[1;30m$text\x1B[0m';

  static String red(String text) => '\x1B[1;31m$text\x1B[0m';

  static String green(String text) => '\x1B[1;32m$text\x1B[0m';

  static String yellow(String text) => '\x1B[1;33m$text\x1B[0m';

  static String blue(String text) => '\x1B[1;34m$text\x1B[0m';

  static String magenta(String text) => '\x1B[1;35m$text\x1B[0m';

  static String cyan(String text) => '\x1B[1;36m$text\x1B[0m';

  static String white(String text) => '\x1B[1;37m$text\x1B[0m';
}

class TermoGame {
  TermoGame._();

  static TermoGame? _instance;
  final _termos = <String>[];
  final _random = Random();

  // Palavras atualmente escolhidas
  final palavrasEscolhidas = <String>[];

  // Informações sobre tentativas
  int _maxTentativas = 0;
  int tentativasRestantes = 0;
  final tentativas = <String>[];

  // Numero de jogos
  int numJogos = 0;

  // Estados atual dos jogos individuais
  final gameStates = <GameState>[];

  // Em qual posição cada jogo terminou
  final gameEndPos = <int>[];

  set maxTentativas(int n) {
    _maxTentativas = n;
    tentativasRestantes = n;
  }

  static Future<TermoGame> instance([int maxTentativas = 5]) async {
    if (_instance == null) {
      TermoGame._instance = TermoGame._();
      await _instance!._inicializar(maxTentativas);
    }
    return _instance!;
  }

  Future<void> _inicializar([int maxTentativas = 5]) async {
    final url =
        "https://raw.githubusercontent.com/LinceTech/dart-workshops/main/dart-desafio-3/de_1/termos.json";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonList = convert.jsonDecode(response.body);
        for (final termo in jsonList['termos']) {
          _termos.add(termo);
        }
      } else {
        throw Exception(
          'Erro na requisicao: [${response.statusCode}] ${response.body}',
        );
      }
    } catch (error, stack) {
      print('Error: $error\n$stack');
    }
  }

  String get palavraAleatoria {
    final String palavraEscolhida = _termos[_random.nextInt(_termos.length)];
    return removerAcentos(palavraEscolhida);
  }

  void geraListas() {
    // Limpa as lista de palavras
    palavrasEscolhidas.clear();
    gameStates.clear();
    gameEndPos.clear();

    // Adiciona itens
    for (int i = 0; i < numJogos; i++) {
      // Escolhe sempre uma palavra diferente
      String novaPalavra = palavraAleatoria;
      while (palavrasEscolhidas.contains(novaPalavra)) {
        novaPalavra = palavraAleatoria;
      }
      palavrasEscolhidas.add(novaPalavra);

      // Adiciona estado jogando
      gameStates.add(GameState.playing);

      // Adiciona posição de fim de jogo
      gameEndPos.add(-1);
    }
  }

  void realizarTentativa() {
    io.stdout.write("\n> ");

    // Pega input
    final String? input = io.stdin.readLineSync();

    // Caso não houver input ou for uma palavra com mais/menos que 5 letras, retorna
    if (input == null) return;
    if (input.length != 5) return;

    // Adiciona na lista de tentativas
    adicionarTentativa(input);
  }

  void adicionarTentativa(String tentativa) {
    // Adiciona a tentativa na lista
    tentativas.add(tentativa);

    // Muda o estado de jogo se necessário
    tentativasRestantes--;
    for (int i = 0; i < numJogos; i++) {
      if (palavrasEscolhidas[i] == tentativa) {
        gameStates[i] = GameState.won;
        gameEndPos[i] = _maxTentativas - tentativasRestantes;
      }
    }
  }

  bool venceu() {
    for (final state in gameStates) {
      if (state != GameState.won) return false;
    }
    return true;
  }

  void imprimirTentativas() {
    // Lista com cada linha de tentativas
    final linhasTentativas = <String>[];

    for (String tentativa in tentativas) {
      // Lista com strings da tentativa de mesma linha de cada jogo
      final linha = <String>[];

      for (int numJogo = 0; numJogo < numJogos; numJogo++) {
        // Verifica se este jogo já acabou
        if (linhasTentativas.length >= gameEndPos[numJogo] &&
            gameStates[numJogo] == GameState.won) {
          linha.add("_ _ _ _ _");
          continue;
        }

        // Texto com caracteres coloridos, informando o que está correto e incorreto
        final caracteresColoridos = List<String>.generate(5, (index) => '');

        // Contador de cada caractere na tentativa atual
        final contadorCaracteres = <String, int>{};

        // Palavra do jogo atual
        final String palavra = palavrasEscolhidas[numJogo];

        // Caracteres verdes (corretos)
        for (int i = 0; i < 5; i++) {
          // Caractere inserido
          final String tentativaChar = tentativa[i];

          // Posição do caractere na palavra correta
          final int posicao = palavra.indexOf(tentativaChar, i);
          if (posicao == -1) {
            continue;
          }

          if (posicao == i || palavra[i] == tentativaChar) {
            // Posição correta
            caracteresColoridos[i] =
                ColorPrint.green(tentativaChar.toUpperCase());
            contadorCaracteres[tentativaChar] =
                (contadorCaracteres[tentativaChar] ?? 0) + 1;
          }
        }

        // Caractere amarelos (posição incorreta)
        for (int i = 0; i < 5; i++) {
          // Caractere inserido
          final String tentativaChar = tentativa[i];

          // Posição do caractere na palavra correta
          final int posicao = palavra.indexOf(tentativaChar);
          if (posicao == -1) {
            continue;
          }

          if (posicao != i &&
              (contadorCaracteres[tentativaChar] ?? 0) <
                  stringCount(palavra, tentativaChar) &&
              caracteresColoridos[i] == '') {
            // Posição incorreta
            caracteresColoridos[i] =
                ColorPrint.yellow(tentativaChar.toUpperCase());
            contadorCaracteres[tentativaChar] =
                (contadorCaracteres[tentativaChar] ?? 0) + 1;
          }
        }

        // Adiciona caracteres brancos onde não foi inserido verde nem amarelo
        for (int i = 0; i < 5; i++) {
          if (caracteresColoridos[i] == '') {
            caracteresColoridos[i] =
                ColorPrint.white(tentativa[i].toUpperCase());
          }
        }

        // Adiciona palavra na linha
        linha.add(caracteresColoridos.join(' '));
      }

      // Adiciona linha na string final
      linhasTentativas.add(linha.join('\t'));
    }

    // Adiciona linhas vazias para as tentativas restantes
    for (int linha = 0; linha < tentativasRestantes; linha++) {
      final textoLinha = <String>[];

      for (int jogo = 0; jogo < numJogos; jogo++) {
        textoLinha.add("_ _ _ _ _");
      }

      linhasTentativas.add(textoLinha.join('\t'));
    }

    // Imprime linhas
    print("\n${linhasTentativas.join('\n')}");
  }

  // Metodo principal do jogo
  void run() {
    imprimirTentativas();
    while (!venceu() && tentativasRestantes > 0) {
      // Pega próxima tentativa do usuário
      realizarTentativa();
      imprimirTentativas();

      // Se o jogo acabou, informa usuário
      if (venceu()) {
        imprimirGanhou();
        continue;
      }
      if (tentativasRestantes == 0) {
        print("\nVocê perdeu.");
        print("\nPalavras: ${palavrasEscolhidas.join(', ')}");
        continue;
      }
    }
  }

  // Metodo que imprime uma mensagem de vitória, baseado na quantidade
  // de tentativas restantes
  void imprimirGanhou() {
    switch (tentativasRestantes) {
      case 0:
        print("\nUfa!");
        break;
      case 1:
        print("\nPor pouco!");
        break;
      case 2:
      case 3:
      case 4:
        print("\nBoa!");
        break;
      default:
        print("\nImpressionante!");
        break;
    }
  }

  // Metodo que reinicia campos para recomeçar o jogo
  void reset({bool calcularTentativas = true}) {
    if (calcularTentativas) maxTentativas = 5 + numJogos;

    tentativas.clear();
    geraListas();
  }

  // Metodo para jogar com 1 jogo
  void termo() {
    numJogos = 1;
    reset();
    run();
  }

  // Metodo para jogar com 2 jogos
  void dueto() {
    numJogos = 2;
    reset();
    run();
  }

  // Metodo para jogar com 4 jogos
  void quarteto() {
    numJogos = 4;
    reset();
    run();
  }

  void custom({required int numJogos, int? numTentativas}) {
    this.numJogos = max(1, numJogos);
    if (numTentativas != null) {
      tentativasRestantes = max(1, numTentativas);
      reset(calcularTentativas: false);
    } else {
      reset();
    }
    run();
  }

  void mostrarRespostas() {
    print("Palavras: ${palavrasEscolhidas.join(', ')}");
  }
}

int stringCount(String string, String char) {
  int count = 0;
  for (final rune in string.runes) {
    if (String.fromCharCode(rune) == char) {
      count++;
    }
  }

  return count;
}

// Função para remover acentos
// https://stackoverflow.com/questions/30844353/how-to-remove-diacritics-accents-from-a-string
String removerAcentos(String str) {
  var withDia =
      'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
  var withoutDia =
      'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

  for (int i = 0; i < withDia.length; i++) {
    str = str.replaceAll(withDia[i], withoutDia[i]);
  }

  return str;
}

bool askUser(String question) {
  io.stdout.write("$question [Y/n]: ");
  final String? input = io.stdin.readLineSync();
  return input != null && input.trim().toLowerCase() != 'n';
}

enum GameState { playing, won, lost }
