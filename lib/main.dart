import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psalms_skrifberymings/src/classes/app_theme.dart';
import 'package:psalms_skrifberymings/src/providers/theme_notifier.dart';
import 'package:psalms_skrifberymings/views/screens/home.dart';
import 'package:psalms_skrifberymings/models/psalm.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (BuildContext context) {
        return ThemeNotifier(
          ThemeMode.system,
        );
      },
      child: const PsalmApp(),
    ),
  );
}

class PsalmApp extends StatelessWidget {
  const PsalmApp({
    super.key,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: themeNotifier.getThemeMode(),
      home: HomeView(
        sang: Psalm.mock(),
      ),
    );
  }
}
