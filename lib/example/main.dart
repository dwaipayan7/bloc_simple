// example/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../simple_cubit.dart';
import '../state_types.dart';

void main() {
  runApp(const MyApp());
}

class CounterCubit extends SimpleCubit<int> {
  CounterCubit() {
    setSuccess(0);
  }

  void increment() => setSuccess((state.data ?? 0) + 1);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlocSimple Example',
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: const CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Counter')),
      body: Center(
        child: BlocBuilder<CounterCubit, SimpleState<int>>(
          builder: (context, state) {
            if (state.isLoading) return const CircularProgressIndicator();
            if (state.isError) return Text('Error: ${state.errorMessage}');
            return Text(
              '${state.data ?? 0}',
              style: const TextStyle(fontSize: 40),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
