import 'package:flutter/material.dart';
import 'package:flutter_morango_vscode/task.dart';

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
            Task(
                'Aprender Flutter asd asd asd asd ',
                'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                3),
            Task('Ir na academia', 'https://i.ibb.co/PsLDtZ2/gato-ok.jpg', 2),
            Task(
                'Jogar Poker', 'https://i.ibb.co/tMFcdJT/gato-furioso.webp', 5),
            Task('Ler', 'https://i.ibb.co/xGqDtRR/gato-chorando.jpg', 2),
            Task('Jogar', 'https://i.ibb.co/VJNKjYD/Fabio-Foto.jpg', 5),
            Task('irra', 'https://i.ibb.co/y0fR9KZ/gato-de-chapeu.jpg', 1)
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
