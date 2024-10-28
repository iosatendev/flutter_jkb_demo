import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: TodoApp()
  )
  );
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});


  @override
  State<StatefulWidget> createState() => TodoAppState();
}

class TodoAppState extends State<TodoApp> {
  List<String> todoItems = [];
  final textController = TextEditingController();

  void _addTodoItem(String task) {
    setState(() {
      todoItems.add(task);
    });
    textController.clear();
  }

  void _removeTodoItem(int index) {
    setState(() {
      todoItems.removeAt(index);
    });
  }

  void showAddTodoDialogue() {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text("Add a new Task"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: "Enter Task here..."
          ),
        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: const Text("Cancel")
          ),
          TextButton(onPressed: () {
            _addTodoItem(textController.text);
            Navigator.pop(context);
          }, child: const Text("Add"))
        ],
      );
    },);
  }

  Widget _buildTodoItem(String todoText, int index) {
    return ListTile(
      title: Text(todoText),
      trailing: IconButton(onPressed: () => _removeTodoItem(index), icon: const Icon(Icons.delete)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Do List"),),
      body: todoItems.isEmpty ?
      const Center(child: Text("No task yet!")) :
      ListView.builder(itemCount: todoItems.length, itemBuilder: (context, index) {
        return _buildTodoItem(todoItems[index], index);
      },),
      floatingActionButton: FloatingActionButton(onPressed: showAddTodoDialogue,
       tooltip: "Add a task",
       child: const Icon(Icons.add),
       ),
    );
    
  }

}