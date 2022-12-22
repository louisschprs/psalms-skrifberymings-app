import 'package:flutter/material.dart';
import 'package:psalms_skrifberymings/models/sang.dart';
import 'package:psalms_skrifberymings/views/widgets/vers_slider.dart';

class PsalmWidgets {
  static AppBar appBar({String title = "Psalm Boek"}) {
    return AppBar(
      title: Text(title),
    );
  }

  static SizedBox versContainer(
      {required BuildContext context,
      required Sang sang,
      required int fontSize}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(12),
            child: VersSlider(
              sang: sang,
              fontSize: fontSize,
            )),
      ),
    );
  }
}
