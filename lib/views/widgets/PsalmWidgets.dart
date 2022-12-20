import 'package:flutter/material.dart';
import 'package:psalms_skrifberymings/models/Vers.dart';
import 'package:psalms_skrifberymings/views/widgets/VersSlider.dart';

class PsalmWidgets {
  static AppBar appBar() {
    return AppBar(
      title: const Text('Psalms & Skrifberyming'),
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

  static Container versContainer(
      {required BuildContext context, required List<Vers> versLys}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Padding(
            padding: EdgeInsets.all(12),
            child: VersSlider(
              versLys: versLys,
            )),
      ),
    );
  }
}
