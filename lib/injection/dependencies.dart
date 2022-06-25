import 'package:cubit_test_app/injection/data_module.dart';
import 'package:cubit_test_app/injection/network_module.dart';
import 'package:cubit_test_app/presentation/app_flavor.dart';

import 'injector.dart';

class DependencyManager {
  static Future<void> inject(AppFlavor flavor) async {
    injector.registerLazySingleton<AppFlavor>(() => flavor);

    await DataModule.inject();
    await NetworkModule.inject(flavor);
    await configureDependencies();
  }
}
