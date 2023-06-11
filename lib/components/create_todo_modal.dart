import 'package:flutter/material.dart';

class CreateTodoModal extends StatelessWidget {
  const CreateTodoModal(
      {super.key,
      required this.onAddTodo,
      required this.onTopicChanged,
      required this.onDescriptionChanged});

  //  void onAddTodo(Todo todo){}
  //  void onTopicChanged(String topic){   }
  //  void onDescriptionChanged(String description){}

  final VoidCallback onAddTodo;
  final ValueChanged<String> onTopicChanged;
  final ValueChanged<String> onDescriptionChanged;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add a Todo"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            child: TextField(
              onChanged: onTopicChanged,
              decoration:
                  const InputDecoration(hintText: "Title", isDense: true),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              onChanged: onDescriptionChanged,
              decoration:
                  const InputDecoration(hintText: "Description", isDense: true),
            ),
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel")),
        TextButton(onPressed: onAddTodo, child: const Text("Save"))
      ],
    );
  }
}
