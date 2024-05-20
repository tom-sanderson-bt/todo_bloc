import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/filter/filter_bloc.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  Widget getFilterItem({
    required BuildContext context,
    required text,
    required Filter filter,
  }) {
    final currentFilter = context.watch<FilterBloc>().state.filter;

    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor:
            currentFilter == filter ? Colors.blueAccent : Colors.black,
      ),
      onPressed: () {
        context.read<FilterBloc>().add(SetFilterEvent(filter: filter));
      },
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        getFilterItem(
          context: context,
          text: "All",
          filter: Filter.all,
        ),
        getFilterItem(
          context: context,
          text: "Active",
          filter: Filter.active,
        ),
        getFilterItem(
          context: context,
          text: "Completed",
          filter: Filter.completed,
        ),
      ],
    );
  }
}
