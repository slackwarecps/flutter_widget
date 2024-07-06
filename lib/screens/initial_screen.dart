import 'package:flutter/material.dart';
import 'package:flutter_morango_vscode/components/task.dart';
import 'package:flutter_morango_vscode/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});
  @override
  State<InitialScreen> createState() => _InitialScreen();
}

class _InitialScreen extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          Task('Mascote Flutter xxxx', 'assets/images/mascote.png', 3),
          Task('Ir na academia ok', 'assets/images/gato-ok.jpg', 2),
          Task('Gato chorando', 'assets/images/gato-chorando.jpg', 5),
          Task('Furioso', 'assets/images/gato-furioso.webp', 2),
          Task('Fabao', 'assets/images/Fabio-Foto.jpg', 5),
          Task('irra', 'assets/images/gato-de-chapeu.jpg', 1),
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
