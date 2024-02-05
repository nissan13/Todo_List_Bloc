import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application_bloc/bloc/todo_bloc.dart';
import 'package:todo_application_bloc/bloc/todo_event.dart';
import 'package:todo_application_bloc/bloc/todo_state.dart';
import 'package:todo_application_bloc/model/todo.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  void _showAddTodoDialog(BuildContext context) {
    TextEditingController _todoController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Todo'),
          content: TextField(
            autofocus: true,
            controller: _todoController,
            decoration: const InputDecoration(hintText: 'Enter your todo'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String todoText = _todoController.text.trim();
                if (todoText.isNotEmpty) {
                  context.read<TodoBloc>().add(AddTodoEvent(Todo(todoText)));
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final todo = state.todos[index];
              return ListTile(
                leading: Checkbox(
                      value: todo.isCompleted,
                      onChanged: (value) {
                        context.read<TodoBloc>().add(ToggleTodoEvent(index));
                      },
                    ),
                title: Text(todo.title),
                trailing: 
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        context.read<TodoBloc>().add(RemoveTodoEvent(index));
                      },
                    ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog(context);
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
