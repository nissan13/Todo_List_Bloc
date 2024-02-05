// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo_application_bloc/bloc/todo_event.dart';
// import 'package:todo_application_bloc/bloc/todo_state.dart';
// import 'package:todo_application_bloc/model/todo.dart';

// class TodoBloc extends Bloc<TodoEvent, TodoState> {
//   TodoBloc() : super(TodoState(const []));

//   @override
//   Stream<TodoState> mapEventToState(TodoEvent event) async* {
//     if (event is AddTodoEvent) {
//       yield TodoState([...state.todos, event.todo]);
//     } else if (event is ToggleTodoEvent) {
//       List<Todo> todos = List.from(state.todos);
//       todos[event.index].isCompleted = !todos[event.index].isCompleted;
//       yield TodoState(todos);
//     } else if (event is RemoveTodoEvent) {
//       List<Todo> todos = List.from(state.todos);
//       todos.removeAt(event.index);
//       yield TodoState(todos);
//     }
//   }
// }

// todo_bloc.dart
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application_bloc/model/todo.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState( [])) {
    on<AddTodoEvent>(_mapAddTodoToState);
    on<ToggleTodoEvent>(_mapToggleTodoToState);
    on<RemoveTodoEvent>(_mapRemoveTodoToState);
  }

   FutureOr<void> _mapAddTodoToState(AddTodoEvent event, Emitter<TodoState> emit) async {
    emit(TodoState([...state.todos, event.todo]));
  }

  FutureOr<void> _mapToggleTodoToState(ToggleTodoEvent event, Emitter<TodoState> emit) async {
    List<Todo> todos = List.from(state.todos);
    todos[event.index].isCompleted = !todos[event.index].isCompleted;
    emit(TodoState(todos));
  }

  FutureOr<void> _mapRemoveTodoToState(RemoveTodoEvent event, Emitter<TodoState> emit) async {
    List<Todo> todos = List.from(state.todos);
    todos.removeAt(event.index);
    emit(TodoState(todos));
  }
}
