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

//Chave Global
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Nova Tarefa'),
          ),
          body: Center(
            child: SingleChildScrollView(
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
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return 'Insira o nome da Tarefa';
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value!.isEmpty ||
                              int.parse(value) > 5 ||
                              int.parse(value) < 1) {
                            return 'Insira uma dificuldade entre 1 e 5';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira uma url de imagem';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.url,
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
                          if (_formKey.currentState!.validate()) {
                            // 1 Printa infos
                            print(_nameController.text);
                            print(int.parse(_difficultyController.text));
                            print(_imageController.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('snackbar! Printando nova Tarefa'),
                              ),
                            );
                            //2 nagevando para a tela anterior
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Adicionar!'))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
