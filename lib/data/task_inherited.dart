import 'package:flutter/material.dart';
import 'package:flutter_morango_vscode/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  // criando uma lista de objetos de estado semelhando a POJOS.
  final List<Task> taskList = [
    Task('Mascote Flutter xxxx', 'assets/images/mascote.png', 3),
    Task('Ir na academia ok', 'assets/images/gato-ok.jpg', 2),
    Task('Gato chorando', 'assets/images/gato-chorando.jpg', 5),
    Task('Furioso', 'assets/images/gato-furioso.webp', 2),
    Task('Fabao', 'assets/images/Fabio-Foto.jpg', 5),
    Task('irra', 'assets/images/gato-de-chapeu.jpg', 1),
  ];

  //adiciona tarefa
  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

/// Retorna uma instância de [TaskInherited] a partir do [context] fornecido.
/// 
/// Esta função procura e retorna uma instância de [TaskInherited] do contexto do chamador.
/// Ela garante que o valor retornado não seja nulo.
/// 
/// Lança um erro de assertiva se nenhum [TaskInherited] for encontrado no contexto.
static TaskInherited of(BuildContext context) {
  final TaskInherited? result =
      context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  assert(result != null, 'No TaskInherited found in context');
  return result!;
}

//Quem fica olhando a mudanca do estado
// notifica todos o tempo todo que o estado mudou
  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
