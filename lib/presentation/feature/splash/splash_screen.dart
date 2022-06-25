import 'package:cubit_test_app/presentation/app_router.dart';
import 'package:cubit_test_app/presentation/feature/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static ScreenRoute get route => ScreenRoute(
        name: '/',
        builder: (_) => const SplashScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Splash Screen',
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              HomeScreen.route('Home').material(),
            ),
            child: const Text('Navigate to home screen'),
          )
        ],
      ),
    );
  }
}
