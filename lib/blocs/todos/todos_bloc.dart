import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_bloc/models/todo.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosState.intial()) {
    on<AddTodoEvent>((event, emit) {
      emit(
        state.copyWith(
          todos: [...state.todos, Todo(title: event.title)],
        ),
      );
    });

    on<UpdateCompletedTodoEvent>((event, emit) {
      emit(
        state.copyWith(
          todos: state.todos.map((todo) {
            if (todo.id == event.id) {
              return Todo(
                id: todo.id,
                title: todo.title,
                isCompleted: event.isCompleted,
              );
            }
            return todo;
          }).toList(),
        ),
      );
    });

    on<DeleteTodoEvent>((event, emit) {
      emit(
        state.copyWith(
          todos: state.todos.where((todo) {
            return !(todo.id == event.id);
          }).toList(),
        ),
      );
    });
  }
}
