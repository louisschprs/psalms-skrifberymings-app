import 'package:flutter/material.dart';
import 'package:psalms_skrifberymings/views/screens/home.dart';
import 'package:psalms_skrifberymings/models/psalm.dart';

void main() {
  runApp(const PsalmApp());
}

class PsalmApp extends StatelessWidget {
  const PsalmApp({
    super.key,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: HomeView(
        sang: Psalm.mock(),
      ),
    );
  }
}
