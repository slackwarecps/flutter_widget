import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _difficultyController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
        ),
        body: Center(
          child: Container(
            height: 650,
            width: 375,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.red,
                width: 3,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _nameController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nome',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _difficultyController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Dificuldade',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (Text) {
                      setState(() {});
                    },
                    controller: _imageController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Imagem',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 72,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.red),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      _imageController.text,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object Exception,
                          StackTrace? stackTrace) {
                        return Image.asset('assets/images/no-photo.png');
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      print(_nameController.text);
                      print(int.parse(_difficultyController.text));
                      print(_imageController.text);
                    },
                    child: Text('Adicionar!'))
              ],
            ),
          ),
        ));
  }
}
