import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:doc_connect/utils/constants/color_konstants.dart';

class AppSlider extends StatefulWidget {
  final int startValue;
  final int endValue;
  final int splitSize;
  final int divisionsCount;
  final int initialVlaue;
  final Function(int) onChanged;
  const AppSlider(
      {super.key,
      required this.endValue,
      required this.splitSize,
      required this.startValue,
      required this.divisionsCount,
      required this.onChanged,
      required this.initialVlaue});

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  double initial = 0;
  int percentage = 0;
  List<Widget> divisions = [];
  int value = 0;
  @override
  void initState() {
    initial = (widget.initialVlaue / widget.initialVlaue) * 100;

    divisions.add(Text("${widget.startValue} Km"));
    int count = widget.divisionsCount - 1;
    for (int i = 1; i <= count; i++) {
      divisions.add(Text("${i * widget.splitSize} Km"));
    }
    divisions.add(Text("${widget.endValue} Km"));
    value = widget.initialVlaue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60,
      child: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, top: 8),
              child: Column(
                children: [
                  Container(
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorKonstants.grey,
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: divisions,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: -6,
              left: initial,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    percentage = ((details.globalPosition.dx /
                                (MediaQuery.of(context).size.width * 0.9)) *
                            100)
                        .ceil();
                    if (percentage > 95) {
                      initial = initial;
                      // percentage = 90;
                      value = widget.endValue;
                      widget.onChanged(value);
                      return;
                    }
                    if (percentage < 3) {
                      initial = initial;
                      // percentage = 90;
                      value = widget.startValue;
                      widget.onChanged(value);
                      return;
                    }
                    value = ((percentage / 100) * widget.endValue).ceil();
                    widget.onChanged(value);
                    initial = details.globalPosition.dx - 20;
                  });
                },
                onTap: () {
                  log("tap");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      ClipPath(
                        clipper: DropletClipper(),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Center(
                              child: Text(
                            value.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropletClipper extends CustomClipper<Path> {
  DropletClipper();
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height / 1.5)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height / 1.5)
      ..arcToPoint(Offset(size.width / 2, 0),
          radius: const Radius.circular(40), clockwise: false)
      ..arcToPoint(Offset(0, size.height / 1.5),
          radius: const Radius.circular(40), clockwise: false)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
