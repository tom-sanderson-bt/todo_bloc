import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/filter/filter_bloc.dart';
import 'package:todo_bloc/blocs/filtered_todos/filtered_todos_bloc.dart';
import 'package:todo_bloc/blocs/search/search_bloc.dart';
import 'package:todo_bloc/blocs/todos/todos_bloc.dart';
import 'package:todo_bloc/observers/app_observer.dart';

import 'pages/todos_page.dart';

void main() {
  Bloc.observer = MyGlobalObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FilterBloc()),
        BlocProvider(create: (context) => SearchBloc()),
        BlocProvider(create: (context) => TodosBloc()),
        BlocProvider(create: (context) => FilteredTodosBloc()),
      ],
      child: MaterialApp(
        title: 'TODO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodosPage(),
      ),
    );
  }
}
