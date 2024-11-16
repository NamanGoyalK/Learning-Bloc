import 'package:bloc_basics/bloc/counter_bloc.dart';
import 'package:bloc_basics/cubit/counter_cubit.dart';
import 'package:bloc_basics/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterCubit(),
        ),
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc Counter',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Click Counter'),
      ),
    );
  }
}
