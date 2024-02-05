import 'package:equatable/equatable.dart';
import 'package:todo_application_bloc/model/todo.dart';

class TodoState extends Equatable {
  final List<Todo> todos;

  TodoState(this.todos);

  @override
  List<Object?> get props => [todos];
}