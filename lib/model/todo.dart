import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String title;
  bool isCompleted;

  Todo( this.title, {this.isCompleted = false});

  @override
  List<Object?> get props => [title, isCompleted];
}