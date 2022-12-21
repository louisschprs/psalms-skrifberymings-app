import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:psalms_skrifberymings/views/widgets/psalm_widgets.dart';

class SelectSangView extends StatefulWidget {
  const SelectSangView({super.key});

  @override
  State<SelectSangView> createState() => _SelectSangViewState();
}

class _SelectSangViewState extends State<SelectSangView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PsalmWidgets.appBar(title: "Kies Lied"),
    );
  }
}
