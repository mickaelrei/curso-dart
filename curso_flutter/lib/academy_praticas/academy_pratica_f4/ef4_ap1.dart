import 'dart:math';
import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

// Lista de cores
final colors = <String, Color>{
  "Blue": Colors.blue,
  "Red": Colors.red,
  "Green": Colors.green,
  "Purple": Colors.purple,
  "Orange": Colors.orange,
  "Brown": Colors.brown,
  "Pink": Colors.pink,
  "White": Colors.white,
  "Black": Colors.black,
};

void main() {
  final random = Random();

  // Adicionando cores aleatórias (HSLColor para cores vibrantes)
  for (int i = 0; i < 15; i++) {
    colors['Random $i'] =
        HSLColor.fromAHSL(1.0, random.nextDouble() * 360, 1.0, 0.5).toColor();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Cria rotas
    final rotas = <String, Widget Function(BuildContext)>{};

    // Adiciona a rota para cor
    rotas['/cor'] = (context) => const ColorRoute();

    // Adiciona rota padrão
    rotas['/'] = (context) => const InitialRoute();

    // Retorna a build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      initialRoute: "/",
      routes: rotas,
    );
  }
}

class InitialRoute extends StatelessWidget {
  const InitialRoute({super.key});

  @override
  Widget build(BuildContext context) {
    // Ordena as cores de acordo com o hue
    final sortedEntries = colors.entries.toList()
      ..sort(
        (entryA, entryB) => HSVColor.fromColor(entryA.value)
            .hue
            .compareTo(HSVColor.fromColor(entryB.value).hue),
      );

    return Scaffold(
      appBar: AppBar(title: const Text("Selecione uma cor")),
      body: ListView.builder(
        itemCount: sortedEntries.length,
        itemBuilder: (context, index) => ColorButton(
            text: sortedEntries[index].key, color: sortedEntries[index].value),
      ),
    );
  }
}

class ColorRoute extends StatelessWidget {
  const ColorRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ModalRoute.of(context)!.settings.arguments as Color,
      appBar: AppBar(title: const Text("Cor selecionada")),
    );
  }
}

class ColorButton extends StatelessWidget {
  const ColorButton({required this.text, required this.color, super.key});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 1.0, bottom: 1.0),
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(color)),
        onPressed: () {
          // Quando clicado, entra na rota com a cor de argumento
          Navigator.pushNamed(context, "/cor", arguments: color);
        },
        child: Text(
          text,
          // Muda a cor do texto de acordo com a luminosidade da cor
          style: TextStyle(
              color: HSVColor.fromColor(color).value > .5
                  ? Colors.black
                  : Colors.white),
        ),
      ),
    );
  }
}
