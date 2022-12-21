import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psalms_skrifberymings/models/sang.dart';
import 'package:psalms_skrifberymings/src/providers/theme_notifier.dart';
import 'package:psalms_skrifberymings/views/screens/select_sang.dart';
import 'package:psalms_skrifberymings/views/widgets/psalm_widgets.dart';

class HomeView extends StatefulWidget {
  final Sang sang;
  const HomeView({super.key, required this.sang});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isDarkTheme = false;
  late ThemeNotifier themeNotifier;

  @override
  Widget build(BuildContext context) {
    isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Psalm Boek'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.text_format),
            tooltip: 'Display Options',
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            icon: Icon((isDarkTheme) ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'App Theme',
            onPressed: () {
              setState(() {
                themeNotifier.setThemeMode(
                    (isDarkTheme) ? ThemeMode.light : ThemeMode.dark);
                isDarkTheme = Theme.of(context).brightness == Brightness.dark;
              });
            },
          ),
        ],
      ),
      body: Container(
        child: PsalmWidgets.versContainer(context: context, sang: widget.sang),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.swap_horiz),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SelectSangView(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
