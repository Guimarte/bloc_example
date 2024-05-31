import 'package:bloc_example/app/example_builder/bloc/example_builder_bloc.dart';
import 'package:bloc_example/app/example_builder/page/example_builder_page.dart';
import 'package:bloc_example/app/home_page/home_page.dart';
import 'package:bloc_example/app/list_name_bloc/bloc/list_name_bloc.dart';
import 'package:bloc_example/app/list_name_bloc/bloc/list_name_event.dart';
import 'package:bloc_example/app/list_name_bloc/bloc/list_name_state.dart';
import 'package:bloc_example/app/list_name_bloc/page/list_name_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        routes: {
          '/example_builder': (_) => BlocProvider(
                create: (_) => ExampleBuilderBloc(),
                child: ExampleBuilderPage(),
              ),
          '/list_name': (_) => BlocProvider(
                create: (_) => ListNameBloc()..add(FindAllNames()),
                child: ListNamePage(),
              )
        });
  }
}
