// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? labelText;
  final String hintText;
  final Function(String) onChanged;
  final String? Function(String?) validator;
  const InputTextField({
    Key? key,
    this.textEditingController,
    this.labelText,
    required this.hintText,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText??"",
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
        TextFormField(
          controller: textEditingController,
          onChanged: onChanged,
          validator: validator,
          decoration: const InputDecoration(
            hintText: "Enter",
            hintStyle: TextStyle(color: Colors.black87),
            // isDense: true,
          ),
        ),
      ],
    );
  }
}
