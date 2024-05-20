import 'package:flutter/material.dart';
import 'package:todo_bloc/widgets/add_todo.dart';
import 'package:todo_bloc/widgets/filters.dart';
import 'package:todo_bloc/widgets/header.dart';
import 'package:todo_bloc/widgets/search_input.dart';
import 'package:todo_bloc/widgets/todos_list.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 40.0,
            ),
            child: Column(
              children: [
                Header(),
                AddTodo(),
                SearchInput(),
                Filters(),
                TodosList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
