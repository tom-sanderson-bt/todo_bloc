import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/search/search_bloc.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _controller,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: "Search todos...",
        ),
        onChanged: (text) {
          context.read<SearchBloc>().add(UpdateSearchEvent(searchText: text));
        });
  }
}
