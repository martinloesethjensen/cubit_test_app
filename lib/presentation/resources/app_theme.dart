import 'package:cubit_test_app/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme(Brightness brightness) {
  final colors = brightness == Brightness.light ? colorsLight : colorsDark;

  return ThemeData(
    brightness: brightness,
    scaffoldBackgroundColor: colors.background,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: colors.background,
      elevation: 0,
      titleTextStyle: const TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
