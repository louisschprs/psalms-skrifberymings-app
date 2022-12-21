import 'package:flutter/material.dart';

class AppTheme {
  get darkTheme => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        /* light theme settings */
      );

  get lightTheme => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        /* light theme settings */
      );
}
