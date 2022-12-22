import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psalms_skrifberymings/models/psalm.dart';
import 'package:psalms_skrifberymings/models/sang.dart';
import 'package:psalms_skrifberymings/src/providers/theme_notifier.dart';
import 'package:psalms_skrifberymings/views/screens/select_sang.dart';
import 'package:psalms_skrifberymings/views/widgets/psalm_widgets.dart';

class HomeView extends StatefulWidget {
  final Sang sang;
  final int fontSize;
  const HomeView({super.key, required this.sang, this.fontSize = 18});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isDarkTheme = false;
  late ThemeNotifier themeNotifier;
  late int fontSize;
  bool isFontSettingsOpen = false;

  @override
  void initState() {
    fontSize = widget.fontSize;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psalm Boek'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.text_format),
            tooltip: 'Display Options',
            onPressed: () {
              setState(() {
                isFontSettingsOpen = !isFontSettingsOpen;
              });
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
        child: PsalmWidgets.versContainer(
            context: context, sang: widget.sang, fontSize: fontSize),
      ),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        children: (isFontSettingsOpen)
            ? withSettingsButtons()
            : [switchSongButtons()],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Container switchSongButtons() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: FloatingActionButton(
        child: const Icon(Icons.swap_horiz),
        onPressed: () async {
          Sang previousSang = await Psalm.fromCollection(widget.sang.nommer);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SelectSangView(
                previousSang: previousSang,
                previousFontSize: fontSize,
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> withSettingsButtons() {
    return [
      Container(
        margin: const EdgeInsets.all(10),
        child: FloatingActionButton(
          heroTag: "TextIncreasSetting",
          child: const Icon(Icons.text_increase),
          onPressed: () {
            setState(() {
              fontSize++;
            });
          },
        ),
      ),
      Container(
        margin: const EdgeInsets.all(10),
        child: FloatingActionButton(
          heroTag: "TextDecreaseSetting",
          child: const Icon(Icons.text_decrease),
          onPressed: () {
            setState(() {
              fontSize--;
            });
          },
        ),
      ),
      switchSongButtons(),
    ];
  }
}
