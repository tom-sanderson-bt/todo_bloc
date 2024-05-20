import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/filter/filter_bloc.dart';
import 'package:todo_bloc/blocs/filtered_todos/filtered_todos_bloc.dart';
import 'package:todo_bloc/blocs/search/search_bloc.dart';
import 'package:todo_bloc/blocs/todos/todos_bloc.dart';
import 'package:todo_bloc/models/todo.dart';

class TodosList extends StatelessWidget {
  const TodosList({super.key});

  void setFilteredTodos({
    required BuildContext context,
    Filter? filter,
    String? searchText,
    List<Todo>? todos,
  }) {
    filter = filter ?? context.read<FilterBloc>().state.filter;
    todos = todos ?? context.read<TodosBloc>().state.todos;
    searchText = searchText ?? context.read<SearchBloc>().state.searchText;

    var filteredTodos = todos.where((todo) {
      return (filter == Filter.all ||
          (filter == Filter.active && !todo.isCompleted) ||
          (filter == Filter.completed && todo.isCompleted));
    });
    if (searchText.trim().isNotEmpty) {
      filteredTodos =
          filteredTodos.where((element) => element.title.contains(searchText!));
    }

    context
        .read<FilteredTodosBloc>()
        .add(UpdateFilteredTodosEvent(filteredTodos: filteredTodos.toList()));
  }

  @override
  Widget build(BuildContext context) {
    var todos = context.watch<FilteredTodosBloc>().state.filteredTodos;

    return MultiBlocListener(
      listeners: [
        BlocListener<TodosBloc, TodosState>(
          listener: (context, state) {
            setFilteredTodos(context: context, todos: state.todos);
          },
        ),
        BlocListener<SearchBloc, SearchState>(
          listener: (context, state) {
            setFilteredTodos(context: context, searchText: state.searchText);
          },
        ),
        BlocListener<FilterBloc, FilterState>(
          listener: (context, state) {
            setFilteredTodos(context: context, filter: state.filter);
          },
        ),
      ],
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: todos.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.grey);
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Checkbox(
              value: todos[index].isCompleted,
              onChanged: (value) {
                context.read<TodosBloc>().add(UpdateCompletedTodoEvent(
                    id: todos[index].id, isCompleted: value!));
              },
            ),
            title: Text(todos[index].title),
          );
        },
      ),
    );
  }
}
