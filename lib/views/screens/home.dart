import 'package:flutter/material.dart';
import 'package:psalms_skrifberymings/models/sang.dart';
import 'package:psalms_skrifberymings/views/widgets/psalm_widgets.dart';

class HomeView extends StatefulWidget {
  final Sang sang;
  const HomeView({super.key, required this.sang});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PsalmWidgets.appBar(),
      body: Container(
        child: PsalmWidgets.versContainer(context: context, sang: widget.sang),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.swap_horiz),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
