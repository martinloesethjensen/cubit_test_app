import 'package:flutter/material.dart';

class AppColors {
  final Color background;

  const AppColors({
    required this.background,
  });
}

const colorsDark = AppColors(
  background: Colors.black,
);

const colorsLight = AppColors(
  background: Colors.white,
);

extension AppColorsExtension on BuildContext {
  AppColors get colors {
    final brightness = Theme.of(this).brightness;
    switch (brightness) {
      case Brightness.light:
        return colorsLight;
      case Brightness.dark:
        return colorsDark;
      default:
        return colorsDark;
    }
  }
}
