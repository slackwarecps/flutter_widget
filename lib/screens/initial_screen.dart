import 'package:flutter/material.dart';
import 'package:flutter_morango_vscode/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen() : super();
  @override
  State<InitialScreen> createState() => _InitialScreen();
}

class _InitialScreen extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: Duration(milliseconds: 800),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            Task('Aprender Flutter asd asd asd asd ', 'images/mascote.png', 3),
            Task('Ir na academia', 'images/gato-ok.jpg', 2),
            Task('Jogar Poker', 'images/gato-furioso.webp', 5),
            Task('Ler', 'images/gato-chorando.jpg', 2),
            Task('Jogar', 'images/Fabio-Foto.jpg', 5),
            Task('irra', 'images/gato-de-chapeu.jpg', 1),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
