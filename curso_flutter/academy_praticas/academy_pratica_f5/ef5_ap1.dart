import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const InitialRoute(),
        "/imagem": (context) {
          final imagem = ModalRoute.of(context)!.settings.arguments as WebImage;

          return ImageRoute(image: imagem);
        },
      },
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InitialRoute extends StatelessWidget {
  const InitialRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Imagens")),
      body: const Center(
        child: ImageViewer(),
      ),
    );
  }
}

class ImageRoute extends StatelessWidget {
  const ImageRoute({required this.image, super.key});

  final WebImage image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Imagem")),
      body: Center(
        child: Image.network(
          // Builder para carregamento da imagem
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            // Caso tenha carregado, mostra a imagem com o título embaixo
            if (loadingProgress == null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: child,
                  ),
                  Text(image.title),
                ],
              );
            }

            // Enquanto não carregou, mostra uma barra de progresso circular
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
                const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Text("Carregando imagem..."),
                ),
              ],
            );
          },
          image.url,
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}

class ImageViewer extends StatefulWidget {
  const ImageViewer({super.key});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  Future<List<WebImage>> getImages() async {
    // Endereço do JSON na internet
    final url = Uri.parse(
        'https://raw.githubusercontent.com/LinceTech/dart-workshops/main/flutter-async/ap_1/request.json');

    // Requisição web para pegar o JSON de imagens
    final response = await http.get(url);

    // Cria lista
    final images = <WebImage>[];

    // Adiciona objetos
    final body = json.decode(response.body);
    for (final object in body) {
      images.add(WebImage.fromJson(object));
    }

    return images;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getImages(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Text("Carregando imagens...");
        }

        final images = snapshot.data as List<WebImage>;
        return ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            final image = images[index];

            return ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(image.id.toString(),
                      style: const TextStyle(color: Colors.grey)),
                  Text(
                    image.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              leading: Image.network(
                image.thumbnailUrl,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width * .2,
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed("/imagem", arguments: image),
            );
          },
        );
      },
    );
  }
}

class WebImage {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  // Construtor padrão
  WebImage(this.id, this.title, this.url, this.thumbnailUrl);

  // Construtor a partir de JSON
  WebImage.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];
}
