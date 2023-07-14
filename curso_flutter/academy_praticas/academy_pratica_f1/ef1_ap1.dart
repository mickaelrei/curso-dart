import 'dart:math';
import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: TextChanger(),
        ),
      ),
    );
  }
}

class TextChanger extends StatefulWidget {
  const TextChanger({super.key});

  @override
  State<TextChanger> createState() => _TextChangerState();
}

class _TextChangerState extends State<TextChanger> {
  // Inicia a cor
  late Color textColor;
  final random = Random();

  Color getRandomColor() =>
      HSLColor.fromAHSL(1.0, random.nextDouble() * 360, 1.0, 0.5).toColor();

  @override
  void initState() {
    super.initState();

    textColor = getRandomColor();
  }

  void changeColor() {
    // Pega nova cor
    setState(() {
      textColor = getRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hello, World!',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: textColor),
        ),
        ElevatedButton(
          onPressed: changeColor,
          child: const Text("Clique pra mudar a cor do texto!"),
        )
      ],
    );
  }
}
