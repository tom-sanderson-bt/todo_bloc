part of 'filtered_todos_bloc.dart';

abstract class FilteredTodosEvent extends Equatable {
  const FilteredTodosEvent();
}

class UpdateFilteredTodosEvent extends FilteredTodosEvent {
  final List<Todo> filteredTodos;

  const UpdateFilteredTodosEvent({required this.filteredTodos});

  @override
  List<Object?> get props => [filteredTodos];

  @override
  String toString() =>
      'UpdateFilteredTodosEvent(filteredTodos: $filteredTodos)';
}
