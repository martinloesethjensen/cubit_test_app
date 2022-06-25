import 'package:cubit_test_app/injection/dependencies.dart';
import 'package:cubit_test_app/presentation/app.dart';
import 'package:cubit_test_app/presentation/app_flavor.dart';
import 'package:flutter/material.dart';

Future<void> mainCommon(AppFlavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  // load from dotenv

  await DependencyManager.inject(flavor);

  // set preferred orientation

  runApp(const App());
}
