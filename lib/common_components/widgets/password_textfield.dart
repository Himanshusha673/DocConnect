// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  TextEditingController textEditingController;
  final Function(String) onchanged;
  final String? Function(String?) validator;
  PasswordTextField(
      {Key? key,
      required this.labelText,
      required this.textEditingController,
      required this.hintText,
      required this.onchanged,
      required this.validator})
      : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _showPassword = false;

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
        TextFormField(
          controller: widget.textEditingController,
          obscureText: !_showPassword,
          onChanged: widget.onchanged,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: "Enter",
            hintStyle: const TextStyle(color: Colors.black),
            suffixIcon: IconButton(
              icon: Icon(
                _showPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                color: Colors.blue,
              ),
              onPressed: _togglePasswordVisibility,
            ),
          ),
        ),
      ],
    );
  }
}
