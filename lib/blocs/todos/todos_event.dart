part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();
}

class AddTodoEvent extends TodosEvent {
  final String title;

  @override
  List<Object> get props => [title];

  const AddTodoEvent({required this.title});

  @override
  String toString() => 'AddTodoEvent(title: $title)';
}

class UpdateCompletedTodoEvent extends TodosEvent {
  final String id;
  final bool isCompleted;

  const UpdateCompletedTodoEvent({
    required this.id,
    required this.isCompleted,
  });

  @override
  List<Object> get props => [id, isCompleted];

  @override
  String toString() =>
      'UpdateCompletedTodoEvent(id: $id, isCompleted: $isCompleted)';
}

class DeleteTodoEvent extends TodosEvent {
  final String id;

  @override
  List<Object> get props => [id];

  const DeleteTodoEvent({required this.id});

  @override
  String toString() => 'DeleteTodoEvent(id: $id)';
}
