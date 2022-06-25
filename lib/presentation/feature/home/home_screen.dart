import 'package:cubit_test_app/injection/injector.dart';
import 'package:cubit_test_app/presentation/app_router.dart';
import 'package:cubit_test_app/presentation/feature/home/cubit/home_cubit.dart';
import 'package:cubit_test_app/presentation/feature/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.title});

  static ScreenRoute route(String title) => ScreenRoute(
        name: '/home',
        builder: (_) => HomeScreen(title: title),
      );

  final String title;
  final _cubit = injector<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<HomeCubit, HomeState>(
                bloc: _cubit,
                builder: (context, state) {
                  return Text(
                    '${state.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'increment',
              onPressed: _cubit.increment,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
              heroTag: 'decrement',
              onPressed: _cubit.decrement,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
