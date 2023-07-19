import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(child: MyWidget()),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  final double margin = 8;
  final double cellSize = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Primeira linha
        Stack(
          children: [
            // Fundo
            Positioned(
              child: Container(
                color: Colors.transparent,
                width: cellSize * 3 + margin * 4,
                height: cellSize + margin * 2,
              ),
            ),
            Positioned(
              top: margin,
              left: margin,
              child: Container(
                color: Colors.red,
                width: cellSize,
                height: cellSize,
              ),
            ),
            Positioned(
              top: margin,
              left: cellSize + margin * 2,
              child: Container(
                color: Colors.green,
                width: cellSize,
                height: cellSize,
              ),
            ),
            Positioned(
              top: margin,
              left: cellSize * 2 + margin * 3,
              child: Container(
                color: Colors.blue,
                width: cellSize,
                height: cellSize,
              ),
            ),
          ],
        ),
        // Segunda linha
        Stack(
          children: [
            // Fundo
            Positioned(
              child: Container(
                color: Colors.yellow,
                width: cellSize * 3 + margin * 4,
                height: cellSize * 2 + margin * 3,
              ),
            ),
            Positioned(
              top: margin * 1.5,
              left: margin,
              child: Container(
                color: Colors.purple,
                width: cellSize,
                height: cellSize * 2,
              ),
            ),
            Positioned(
              top: margin * 1.5,
              left: cellSize + margin * 2,
              child: Container(
                color: Colors.cyan,
                width: cellSize,
                height: cellSize * 2,
              ),
            ),
            Positioned(
              top: margin,
              left: cellSize * 2 + margin * 3,
              child: Container(
                color: Colors.purple,
                width: cellSize,
                height: cellSize,
              ),
            ),
            Positioned(
              top: cellSize + margin * 2,
              left: cellSize * 2 + margin * 3,
              child: Container(
                color: Colors.cyan,
                width: cellSize,
                height: cellSize,
              ),
            ),
          ],
        ),
        // Terceira linha
        Padding(
          padding: EdgeInsets.only(top: margin),
          child: Stack(
            children: [
              // Fundo
              Positioned(
                child: Container(
                  color: Colors.grey,
                  width: cellSize * 2,
                  height: cellSize + margin * 2,
                ),
              ),
              Positioned(
                top: margin,
                left: cellSize * .5,
                child: Container(
                  color: Colors.black,
                  width: cellSize,
                  height: cellSize,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
