import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:psalms_skrifberymings/models/sang.dart';
import 'package:psalms_skrifberymings/views/widgets/vers_slider.dart';

class PsalmWidgets {
  static AppBar appBar({String title = "Psalm Boek"}) {
    bool themeMode = true;
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.text_format),
          tooltip: 'Display Options',
          onPressed: () {
            // handle the press
          },
        ),
        IconButton(
          icon: Icon((themeMode) ? Icons.dark_mode : Icons.light_mode),
          tooltip: 'App Theme',
          onPressed: () {
            themeMode = !themeMode;
          },
        ),
      ],
    );
  }

  static SizedBox versContainer(
      {required BuildContext context, required Sang sang}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(12),
            child: VersSlider(
              sang: sang,
            )),
      ),
    );
  }
}
