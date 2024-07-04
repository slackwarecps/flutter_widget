import 'package:flutter/material.dart';
import 'package:flutter_morango_vscode/difficulty.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    bool opacidade = true;
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
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
                Task('Ir na academia', 'https://i.ibb.co/PsLDtZ2/gato-ok.jpg',
                    2),
                Task('Jogar Poker',
                    'https://i.ibb.co/tMFcdJT/gato-furioso.webp', 5),
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
        ));
  }
}

// Meu primeiro widget
class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.blue),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                height: 100,
                child: (Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(
                                fontSize: 24, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Difficulty(
                          difficultyLevel: widget.dificuldaa,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });

                            print(nivel);
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )),
                    )
                  ],
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: (widget.dificuldade > 0)
                            ? (nivel / widget.dificuldade) / 10
                            : 1,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nivel: $nivel',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
