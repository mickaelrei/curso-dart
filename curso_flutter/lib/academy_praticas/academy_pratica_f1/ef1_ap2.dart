import 'dart:math';
import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  // Caso desejar, voce pode incluir o tanto de botoes e tentativas no jogo:
  // runApp(const MyApp(
  //   buttonCount: 8,
  //   maxTries: 5,
  // ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({this.buttonCount = 3, this.maxTries = 2, super.key});

  final int buttonCount;
  final int maxTries;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: GameHandler(buttonCount: buttonCount, maxTries: maxTries),
    );
  }
}

class GameHandler extends StatefulWidget {
  const GameHandler({this.buttonCount = 3, this.maxTries = 2, super.key});

  final int buttonCount;
  final int maxTries;

  @override
  State<GameHandler> createState() => _GameHandlerState();
}

class _GameHandlerState extends State<GameHandler> {
  final random = Random();
  late int correctButton;
  late int remainingTries;
  GameState gameState = GameState.playing;

  @override
  void initState() {
    super.initState();

    // Inicia as tentativas restantes
    remainingTries = widget.maxTries;
    setCorrectButton();
  }

  void setCorrectButton() {
    // Inicia um valor aletorio para o botao correto
    correctButton = random.nextInt(widget.buttonCount);
  }

  // Metodo para verificar se o usuario ganhou ou perdeu
  void onPressed(int buttonNum) {
    setState(() {
      // Se é o botao correto, venceu o jogo
      if (buttonNum == correctButton) {
        gameState = GameState.won;
        return;
      }

      // Se for o botao errado, diminui uma tentativa restante ou perde
      if (remainingTries == 1) {
        gameState = GameState.lost;
      } else {
        remainingTries--;
      }
    });
  }

  // Metodo que reinicia as variaveis para recomeçar o jogo
  void reset() {
    setState(() {
      remainingTries = widget.maxTries;
      gameState = GameState.playing;
      setCorrectButton();
    });
  }

  // Metodo que cria os botões do jogo
  List<ElevatedButton> criaBotoes() {
    final children = <ElevatedButton>[];
    for (int i = 0; i < widget.buttonCount; i++) {
      children.add(ElevatedButton(
        onPressed: () {
          onPressed(i);
        },
        child: Text("Botão ${String.fromCharCode(65 + i)}"),
      ));
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    // Definir cor de fundo e itens na coluna de acordo com estado
    late List<Widget> children;
    late Color backgroundColor;

    switch (gameState) {
      case GameState.playing:
        children = [
          Text("Tentativas restantes: $remainingTries"),
          ...criaBotoes()
        ];
        backgroundColor = darkBlue;
        break;
      case GameState.won:
        children = [
          const Text("Você ganhou!"),
          ElevatedButton(onPressed: reset, child: const Text("Reiniciar"))
        ];
        backgroundColor = Colors.green;
        break;
      case GameState.lost:
        children = [
          const Text("Você perdeu."),
          ElevatedButton(onPressed: reset, child: const Text("Reiniciar"))
        ];
        backgroundColor = Colors.red;
        break;
    }

    // Retorna widget contendo os itens
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}

enum GameState { playing, won, lost }
