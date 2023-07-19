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
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      home: const Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final random = Random();
  final double shapeSize = 75;

  Shape shape = Shape.circle;
  late Color shapeColor;

  // Inicializa campos
  @override
  void initState() {
    super.initState();

    shapeColor = getRandomColor();
  }

  // Retorna cor vibrante aleatoria
  Color getRandomColor() =>
      HSLColor.fromAHSL(1, random.nextDouble() * 360, 1, .5).toColor();

  // Muda forma da figura
  void changeShape() {
    setState(() {
      if (shape == Shape.circle) {
        shape = Shape.square;
      } else {
        shape = Shape.circle;
      }
    });
  }

  // Muda cor da figura
  void changeColor() {
    setState(() {
      shapeColor = getRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      // Primeira linha, com os botões
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ElevatedButton(
            onPressed: changeShape,
            child: Text(
                "Mudar para ${shape == Shape.circle ? 'quadrado' : 'círculo'}"),
          ),
        ),
        ElevatedButton(
            onPressed: changeColor, child: const Text("Cor aleatoria"))
      ]),

      // Segunda linha, com a figura
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: shapeSize,
            height: shapeSize,
            decoration: BoxDecoration(
              color: shapeColor,
              borderRadius: BorderRadius.all(
                Radius.circular(shape == Shape.circle ? shapeSize * .5 : 0),
              ),
            ),
          ),
        ],
      )
    ]);
  }
}

enum Shape { square, circle }
