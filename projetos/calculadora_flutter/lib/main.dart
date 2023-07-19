import 'package:flutter/material.dart';
import 'dart:math';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Calculator")),
        body: const Center(
          child: Calculator(),
        ),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final int cellSize = 50;

  final Color numberColor = const Color.fromARGB(255, 217, 225, 231);
  final Color operatorColor = const Color.fromARGB(255, 156, 156, 156);
  final Color evaluateColor = const Color.fromARGB(255, 226, 145, 38);
  final Color visorColor = const Color.fromARGB(255, 57, 59, 59);

  // Calculator info
  final int visorMaxSize = 16;

  double memory = 0;
  double lastOperand = 0;
  bool newOperand = true;

  Operator? lastOperator;
  String visorText = "";

  @override
  void initState() {
    super.initState();

    visorText = "0";
  }

  void setMemory(double value) {
    print("Set memory to $value");
    setState(() {
      memory = value;
      visorText = round(value, 15).toString();

      capVisor();
    });
  }

  void onOperator(Operator operator) {
    // Get number on visor
    final double? onVisor = double.tryParse(visorText);
    // If failed to parse, number is either too small or too large. Return
    if (onVisor == null) return;

    // What operator will be checked
    Operator? operatorToCheck;
    if (operator == Operator.eval) {
      if (lastOperator == null) return;

      operatorToCheck = lastOperator;
    }

    // Get new memory based on operator
    late double newMemory;
    switch (operatorToCheck) {
      case Operator.add:
        newMemory = memory + lastOperand;
        break;
      case Operator.sub:
        newMemory = memory - lastOperand;
        break;
      case Operator.mult:
        newMemory = memory * lastOperand;
        break;
      case Operator.div:
        // Handle division by zero
        if (lastOperand == 0) {
          newMemory = 0;
        } else {
          newMemory = memory / lastOperand;
        }
        break;
      default:
        // Eval or null, just set to whatever is on visor
        newMemory = onVisor;
        break;
    }

    // Check if new value uses scientific notation
    if (newMemory.toString().contains("e")) return;

    // Set new memory
    setMemory(newMemory);
    newOperand = true;

    // Update last operator if it's not evaluation
    if (operator != Operator.eval) {
      print("Set last operator to ${operator.name}");
      lastOperator = operator;
    }
  }

  void onNumber(int number) {
    setState(() {
      if (newOperand) {
        // Override number
        visorText = number.toString();
        newOperand = false;
      } else {
        // Add number to end
        visorText += number.toString();
      }

      // Format visor text
      removeLeadingZeros();
      capVisor();

      // Set last operand to be whatever is on screen
      lastOperand = double.parse(visorText);
    });
  }

  // Add floating point on number
  void floatingPoint() {
    setState(() {
      if (visorText.contains(".") || visorText.length >= visorMaxSize) return;

      if (newOperand) {
        // Override number
        visorText = "0.";
        newOperand = false;
      } else {
        // Add number to end
        visorText += ".";
      }

      // Format
      removeLeadingZeros();

      // Set last operand
      lastOperand = double.parse(visorText);
    });
  }

  // Clear calculator memory
  void onClear() {
    setState(() {
      lastOperand = 0;
      lastOperator = null;
      newOperand = true;
      memory = 0;
      visorText = "0";
    });
  }

  // Remove zeros to the left
  void removeLeadingZeros() {
    // Keep removing zeros, leaving only 1
    while (visorText[0] == "0" && visorText.length > 1 && visorText[1] != ".") {
      visorText = visorText.substring(1);
    }
  }

  // Cap to max size
  void capVisor() {
    visorText = visorText.substring(0, min(visorText.length, visorMaxSize));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Visor row
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CalculatorCell(
            text: visorText,
            width: cellSize * 4.0,
            height: cellSize * 1.0,
            textColor: Colors.white,
            backgroundColor: visorColor,
            textCentered: false,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          )
        ]),

        // First number row
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CalculatorCell(
            text: "7",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: numberColor,
            onTap: () {
              onNumber(7);
            },
          ),
          CalculatorCell(
            text: "8",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: numberColor,
            onTap: () {
              onNumber(8);
            },
          ),
          CalculatorCell(
            text: "9",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: numberColor,
            onTap: () {
              onNumber(9);
            },
          ),
          CalculatorCell(
            text: "/",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: operatorColor,
            onTap: () {
              onOperator(Operator.div);
            },
          ),
        ]),

        // Second number row
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CalculatorCell(
            text: "4",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: numberColor,
            onTap: () {
              onNumber(4);
            },
          ),
          CalculatorCell(
            text: "5",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: numberColor,
            onTap: () {
              onNumber(5);
            },
          ),
          CalculatorCell(
            text: "6",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: numberColor,
            onTap: () {
              onNumber(6);
            },
          ),
          CalculatorCell(
            text: "*",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: operatorColor,
            onTap: () {
              onOperator(Operator.mult);
            },
          ),
        ]),

        // Third number row
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CalculatorCell(
            text: "1",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: numberColor,
            onTap: () {
              onNumber(1);
            },
          ),
          CalculatorCell(
            text: "2",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: numberColor,
            onTap: () {
              onNumber(2);
            },
          ),
          CalculatorCell(
            text: "3",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: numberColor,
            onTap: () {
              onNumber(3);
            },
          ),
          CalculatorCell(
            text: "-",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: operatorColor,
            onTap: () {
              onOperator(Operator.sub);
            },
          ),
        ]),

        // Final number row
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CalculatorCell(
            text: "0",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: numberColor,
            onTap: () {
              onNumber(0);
            },
          ),
          CalculatorCell(
            text: ".",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: numberColor,
            onTap: floatingPoint,
          ),
          CalculatorCell(
            text: "C",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: numberColor,
            onTap: onClear,
          ),
          CalculatorCell(
            text: "+",
            width: cellSize * 1.0,
            height: cellSize * 1.0,
            backgroundColor: operatorColor,
            onTap: () {
              onOperator(Operator.add);
            },
          ),
        ]),

        // Evaluate row
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CalculatorCell(
            text: "=",
            width: cellSize * 4.0,
            height: cellSize * 1.0,
            backgroundColor: evaluateColor,
            fontSize: 35,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            onTap: () {
              onOperator(Operator.eval);
            },
          )
        ])
      ],
    );
  }
}

class CalculatorRow extends StatelessWidget {
  const CalculatorRow({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}

class CalculatorCell extends StatelessWidget {
  const CalculatorCell(
      {required this.text,
      required this.width,
      required this.height,
      this.onTap,
      this.textCentered = true,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black,
      this.borderRadius,
      this.fontSize,
      super.key});

  final bool textCentered;
  final String text;
  final double width, height;
  final double? fontSize;
  final Color backgroundColor, textColor;
  final OnPressedFunction? onTap;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final textCell = CalculatorText(
      text: text,
      color: textColor,
      fontSize: fontSize,
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        width: width,
        height: height,
        child: textCentered
            ? Center(
                child: textCell,
              )
            : Padding(
                padding: const EdgeInsets.only(right: 10, top: 12),
                child: textCell,
              ),
      ),
    );
  }
}

class CalculatorText extends StatelessWidget {
  const CalculatorText(
      {required this.text,
      this.color = Colors.black,
      this.fontSize,
      super.key});

  final String text;
  final Color color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.end,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? 18,
        fontFamily: "RobotMono",
      ),
    );
  }
}

num round(double n, int precision) {
  if (precision == 0) return n.round();

  // Convert to string
  String strNum = n.toString();

  // Get index of floating point
  final int pointIdx = strNum.indexOf(".");
  if (pointIdx == -1) return n;

  // Check for scientific notation
  if (!strNum.contains("e")) {
    // Remove trailing digits
    strNum = strNum.substring(0, min(pointIdx + precision + 1, strNum.length));
  }

  // Check if all trailing digits are zeros
  for (int i = pointIdx + 1; i < strNum.length; i++) {
    if (strNum[i] != "0") return double.parse(strNum);
  }

  // If got here, all digits after floating points were zero
  return double.parse(strNum.substring(0, pointIdx)).round();
}

enum Operator { div, mult, sub, add, eval }

typedef OnPressedFunction = void Function();
