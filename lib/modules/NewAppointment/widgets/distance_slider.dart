import 'package:flutter/material.dart';
import 'package:doc_connect/modules/NewAppointment/widgets/slider.dart';

class DistanceSlider extends StatelessWidget {
  final String title;
  final bool isMandatory;
  final Function(int) onChanged;
  final int initialValue;
  const DistanceSlider({
    super.key,
    required this.isMandatory,
    required this.title,
    required this.onChanged,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          title != ""
              ? Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      isMandatory
                          ? const Text(
                              " *",
                              style: TextStyle(color: Colors.red),
                            )
                          : Container()
                    ],
                  ),
                )
              : Container(),
          AppSlider(
            endValue: 10,
            splitSize: 5,
            startValue: 1,
            initialVlaue: initialValue,
            divisionsCount: 2,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
