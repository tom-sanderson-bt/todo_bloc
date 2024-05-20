part of 'todos_bloc.dart';

class TodosState extends Equatable {
  final List<Todo> todos;

  const TodosState({
    required this.todos,
  });

  get remainingItemCount {
    return todos.where((element) => !element.isCompleted).length;
  }

  factory TodosState.intial() {
    return TodosState(todos: [
      Todo(title: 'Drive to Devon'),
      Todo(title: 'Have a pint'),
      Todo(title: 'Checkin to Caravan'),
    ]);
  }

  @override
  String toString() => 'TodosState(todos: $todos)';

  @override
  List<Object> get props => [todos];

  TodosState copyWith({
    List<Todo>? todos,
  }) {
    return TodosState(
      todos: todos ?? this.todos,
    );
  }
}
