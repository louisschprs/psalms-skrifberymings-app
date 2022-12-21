import 'package:flutter/material.dart';
import 'package:psalms_skrifberymings/models/sang.dart';
import 'package:psalms_skrifberymings/views/widgets/vers_slider.dart';

class PsalmWidgets {
  static AppBar appBar({String title = "Psalm Boek"}) {
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
          icon: const Icon(Icons.fullscreen),
          tooltip: 'Show FullScreen',
          onPressed: () {
            // handle the press
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
