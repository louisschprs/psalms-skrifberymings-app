import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psalms_skrifberymings/models/sang.dart';
import 'package:psalms_skrifberymings/src/enums/sang_tipe.dart';

class VersSlider extends StatefulWidget {
  final Sang sang;
  final int fontSize;
  const VersSlider({
    super.key,
    required this.sang,
    required this.fontSize,
  });

  @override
  State<VersSlider> createState() => _VersSliderState();
}

class _VersSliderState extends State<VersSlider> {
  late PageController _pageController;
  late String sangText;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    sangText = (SangTipe.psalm == widget.sang.tipe) ? "Psalm" : "Skrifberyming";
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, position) {
        return SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "$sangText ${widget.sang.nommer} Vers ${widget.sang.verse[position].nommer}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: widget.fontSize + 6,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    widget.sang.verse[position].text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 2,
                      fontSize: widget.fontSize.toDouble(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        );
      },
      itemCount: widget.sang.verse.length,
    );
  }
}
