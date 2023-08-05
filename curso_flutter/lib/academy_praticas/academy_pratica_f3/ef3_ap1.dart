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
          child: MyForm(),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // Chave do formulario
  final _formKey = GlobalKey<FormState>();

  // Informações do usuário
  String nome = "";
  int idade = 0;
  bool inativo = false;
  bool enviado = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Título
                const Text("Insira seus dados:"),
                // Nome
                TextFormField(
                  onChanged: (value) => nome = value,
                  decoration: const InputDecoration(
                    labelText: "Nome",
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.length < 3 ||
                        value[0].toUpperCase() != value[0]) {
                      return "Precisa ter ao menos 3 letras, sendo a primeira maiúscula";
                    }

                    return null;
                  },
                ),
                // Idade
                TextFormField(
                  onChanged: (value) {
                    idade = int.tryParse(value) ?? 0;
                  },
                  decoration: const InputDecoration(
                    labelText: "Idade",
                  ),
                  validator: (value) {
                    if (value == null ||
                        int.tryParse(value) == null ||
                        int.parse(value) < 18) {
                      return "Precisa ser um número válido, maior ou igual a 18";
                    }

                    return null;
                  },
                ),

                // Inativo
                Row(
                  children: [
                    Checkbox(
                      value: inativo,
                      onChanged: (value) {
                        setState(() {
                          inativo = value!;
                        });
                      },
                    ),
                    const Text("Inativo")
                  ],
                ),

                // Botão de submit
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Muda o estado para incluir o Stack com as informações
                      setState(() {
                        enviado = true;
                      });
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),

        // Informações do usuario
        if (enviado)
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .8,
                height: 150,
                color: inativo ? Colors.grey : Colors.green,
              ),
              Positioned(
                top: 15,
                left: 15,
                child: Text(
                  nome != "" ? "Nome: $nome" : "",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 15,
                child: Text(
                  idade != 0 ? "Idade: $idade" : "",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )
      ],
    );
  }
}
