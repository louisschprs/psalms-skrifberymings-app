import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:psalms_skrifberymings/models/Vers.dart';

class VersSlider extends StatefulWidget {
  final List<Vers> versLys;
  const VersSlider({
    super.key,
    required this.versLys,
  });

  @override
  State<VersSlider> createState() => _VersSliderState();
}

class _VersSliderState extends State<VersSlider> {
  late PageController _pageController;
  int _currentVers = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
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
        return Center(
          child: Text(
            widget.versLys[position].text,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        );
      },
      itemCount: widget.versLys.length,
    );
  }
}
