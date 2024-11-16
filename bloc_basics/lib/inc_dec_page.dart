import 'package:flutter/material.dart';
import 'package:bloc_basics/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncDecPage extends StatelessWidget {
  const IncDecPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Increment/Decrement'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterCubit, int>(
              bloc: counterCubit,
              builder: (context, counter) {
                return Text(
                  '$counter',
                  style: const TextStyle(
                      fontSize: 150, fontWeight: FontWeight.bold),
                  semanticsLabel: 'Counter',
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton.filled(
            onPressed: () {
              counterCubit.increment();
            },
            icon: const Icon(Icons.add),
            tooltip: 'Increment',
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.all(10),
            ),
          ),
          const SizedBox(height: 10),
          IconButton.filledTonal(
            onPressed: () {
              counterCubit.decrement();
            },
            icon: const Icon(Icons.remove),
            tooltip: 'Decrement',
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.all(10),
            ),
          ),
        ],
      ),
    );
  }
}
