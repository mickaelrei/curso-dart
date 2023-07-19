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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Primeira figura
        Stack(
          children: [
            // Fundo
            Positioned(
              child: Container(
                color: Colors.grey,
                width: cellSize * 2,
                height: cellSize * 2,
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
              top: margin * 2,
              left: margin * 2,
              child: Container(
                color: Colors.green,
                width: cellSize,
                height: cellSize,
              ),
            ),
            Positioned(
              top: margin * 3,
              left: margin * 3,
              child: Container(
                color: Colors.blue,
                width: cellSize,
                height: cellSize,
              ),
            ),
          ],
        ),
        // Segunda figura
        Stack(
          children: [
            // Fundo
            Positioned(
              child: Container(
                color: Colors.black,
                width: cellSize * 2,
                height: cellSize * 2,
              ),
            ),
            Positioned(
              top: margin,
              left: margin,
              child: Container(
                color: Colors.cyan,
                width: cellSize,
                height: cellSize,
              ),
            ),
            Positioned(
              top: margin * 2,
              left: margin * 2,
              child: Container(
                color: Colors.purple,
                width: cellSize,
                height: cellSize,
              ),
            ),
            Positioned(
              top: margin * 3,
              left: margin * 3,
              child: Container(
                color: Colors.yellow,
                width: cellSize,
                height: cellSize,
              ),
            ),
          ],
        ),
        // Terceira figura
        Stack(
          children: [
            // Fundo
            Positioned(
              child: Container(
                color: Colors.transparent,
                width: cellSize * 2,
                height: cellSize * 2,
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
              top: margin * 2,
              left: margin * 2,
              child: Container(
                color: Colors.yellow,
                width: cellSize,
                height: cellSize,
              ),
            ),
            Positioned(
              top: margin * 3,
              left: margin * 3,
              child: Container(
                color: Colors.blue,
                width: cellSize,
                height: cellSize,
              ),
            ),
          ],
        ),
        // Quarta figura
        Stack(
          children: [
            // Fundo
            Positioned(
              child: Container(
                color: Colors.white,
                width: cellSize * 2,
                height: cellSize * 2,
              ),
            ),
            Positioned(
              top: margin,
              left: margin,
              child: Container(
                color: Colors.deepPurple,
                width: cellSize,
                height: cellSize,
              ),
            ),
            Positioned(
              top: margin * 2,
              left: margin * 2,
              child: Container(
                color: Colors.deepOrange,
                width: cellSize,
                height: cellSize,
              ),
            ),
            Positioned(
              top: margin * 3,
              left: margin * 3,
              child: Container(
                color: Colors.lightGreen,
                width: cellSize,
                height: cellSize,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
