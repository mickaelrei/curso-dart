import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

// Lista de cores
const colors = <String, Color>{
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Cria rotas
    final rotas = <String, Widget Function(BuildContext)>{};

    // Define rota pra cada cor
    colors.forEach((nome, Color cor) {
      rotas['/$nome'] = (context) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: cor),
            home: Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Quando clicado, volta para a rota anterior
                    Navigator.pop(context);
                  },
                  child: const Text("Voltar"),
                ),
              ),
            ),
          );
    });

    // Ordena as cores de acordo com o hue
    final sortedEntries = colors.entries.toList()
      ..sort(
        (entryA, entryB) => HSVColor.fromColor(entryA.value)
            .hue
            .compareTo(HSVColor.fromColor(entryB.value).hue),
      );

    // Adiciona rota padrão
    rotas['/'] = (context) => Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Cria um botão pra cada cor no map
                  for (final entry in sortedEntries)
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(entry.value)),
                      onPressed: () {
                        // Quando clicado, entra na rota
                        Navigator.pushNamed(context, "/${entry.key}");
                      },
                      child: Text(
                        entry.key,
                        // Muda a cor do texto de acordo com a luminosidade da cor
                        style: TextStyle(
                            color: HSVColor.fromColor(entry.value).value > .5
                                ? Colors.black
                                : Colors.white),
                      ),
                    )
                ],
              ),
            ),
          ),
        );

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

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
