import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:psalms_skrifberymings/models/Psalm.dart';
import 'package:psalms_skrifberymings/models/Vers.dart';
import 'package:psalms_skrifberymings/src/enums/Beryming.dart';
import 'package:psalms_skrifberymings/views/widgets/PsalmWidgets.dart';

class ScreenScaffold extends StatefulWidget {
  const ScreenScaffold({super.key});

  @override
  State<ScreenScaffold> createState() => _ScreenScaffoldState();
}

class _ScreenScaffoldState extends State<ScreenScaffold> {
  Psalm psalm = Psalm("Psalm 1", Beryming.TOTIUS, [
    Vers(1,
        " Welsalig hy wat op die spoor nie gaan waar sondaars lok; wat op hul pad nie staan, of neersit waar die spotglans in die oog is, waar spotters vrolik spot met al wat hoog is; maar wat Gods wet in stille mymering, by dag en nag, weer in gedagt'nis bring."),
    Vers(1, 'Vers twee'),
    Vers(1, 'Vers drie'),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PsalmWidgets.appBar(),
      body: Container(
        child:
            PsalmWidgets.versContainer(context: context, versLys: psalm.verse),
      ),
    );
  }
}
