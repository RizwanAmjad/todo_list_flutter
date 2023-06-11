import 'package:flutter/material.dart';
import 'package:todo_list/components/create_todo_modal.dart';
import 'package:todo_list/models/todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TodoScreen();
}

class _TodoScreen extends State<TodoScreen> {
  Todo currentTodo = Todo("", "");
  List<Todo> todos = [];

  void _openAddTodoAlert() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CreateTodoModal(onTopicChanged: (topic) {
        setState(() {
          currentTodo.topic = topic;
        });
      }, onDescriptionChanged: (description) {
        setState(() {
          currentTodo.description = description;
        });
      }, onAddTodo: () {
        setState(() {
          todos.add(currentTodo.clone());
          currentTodo.topic = '';
          currentTodo.description = '';
        });

        Navigator.of(context).pop();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo App")),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) => Dismissible(
            key: Key("$index"),
            background: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Icon(Icons.delete)]),
            onDismissed: (direction) {
              setState(() {
                todos.removeAt(index);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(todos[index].topic),
                        Text(todos[index].description)
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTodoAlert,
        child: const Icon(Icons.add),
      ),
    );
  }
}
