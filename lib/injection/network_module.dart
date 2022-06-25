import 'package:cubit_test_app/injection/injector.dart';
import 'package:cubit_test_app/presentation/app_flavor.dart';

class NetworkModule {
  static Future<void> inject(AppFlavor flavor) async {
    // ignore: unused_local_variable
    final flavor = injector<AppFlavor>();

    // dio http client
  }
}
