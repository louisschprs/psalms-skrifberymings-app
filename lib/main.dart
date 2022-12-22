import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psalms_skrifberymings/src/classes/app_theme.dart';
import 'package:psalms_skrifberymings/src/database/db.dart';
import 'package:psalms_skrifberymings/src/providers/theme_notifier.dart';
import 'package:psalms_skrifberymings/views/screens/home.dart';
import 'package:psalms_skrifberymings/models/psalm.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await path_provider.getApplicationDocumentsDirectory();
  await DB().init(directory);
  await DB().seed();
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (BuildContext context) {
        return ThemeNotifier(
          ThemeMode.system,
        );
      },
      child: PsalmApp(
        psalm: await Psalm.fromCollection(1),
      ),
    ),
  );
}

class PsalmApp extends StatelessWidget {
  final Psalm psalm;
  const PsalmApp({super.key, required this.psalm});
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
        sang: psalm,
      ),
    );
  }
}
