import 'package:flutter/material.dart';
import 'package:todo_application_bloc/screens/add_todos.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoPageState();
}

class _TodoPageState extends State<Todo> {
  final int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          int counter = count + 1;
          return ListTile(
            title: Text("$counter"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTodo(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
