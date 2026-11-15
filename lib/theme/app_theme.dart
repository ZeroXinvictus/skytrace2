import 'package:flutter/material.dart';

import 'colors.dart';
import 'component_styles.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light => AppComponents.theme(AppPalette.dark, Brightness.dark);

  static ThemeData get dark => AppComponents.theme(AppPalette.dark, Brightness.dark);

  static ThemeMode modeFrom(String value) => ThemeMode.dark;
}
