import 'package:flutter/material.dart';

class CommonDropDownButton extends StatelessWidget {
  final List<String> item;
  final String value;
  final String label;
  final bool isAstrick;
  final Function(String?) onChanged;

  const CommonDropDownButton(
      {super.key,
      required this.item,
      required this.value,
      required this.onChanged,
      required this.label,
      this.isAstrick = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text: label,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(
                          text: isAstrick ? " *" : '',
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ))
                    ]),
                //textScaleFactor: labelTextScal
                textScaleFactor: 1,
                maxLines: 2,
              ),
            ],
          ),
          DropdownButtonFormField(
              icon: const Icon(Icons.keyboard_arrow_down),
              dropdownColor: Colors.grey.shade100,
              decoration: const InputDecoration(

                  //fillColor: Colors.grey,
                  ),
              disabledHint: const Text(
                "Can't select",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              value: value,
              items: item.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged),
        ],
      ),
    );
  }
}
