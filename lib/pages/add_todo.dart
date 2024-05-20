import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/todos/todos_bloc.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _controller,
        decoration: const InputDecoration(
          labelText: "What to do?",
        ),
        onSubmitted: (text) {
          context.read<TodosBloc>().add(AddTodoEvent(title: text));
          _controller.clear();
        });
  }
}
