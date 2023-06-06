import 'package:flutter/material.dart';

class BoxTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String> validator;
  final VoidCallback onTap;
  final Function(String)? onChanged;
  final String? hintText;
  final bool readOnly;
  final TextInputType keyboardType;
  final bool isAstrick;
  final String label;
  final Widget? suffix;
  final Widget? prefix;

  const BoxTextField({
    Key? key,
    this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
    required this.onTap,
    required this.label,
    this.suffix,
    this.prefix,
    required this.isAstrick,
    this.hintText,
    this.readOnly = false,
    required this.onChanged,
    required Null Function() onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    ),
                    children: [
                      TextSpan(
                          text: isAstrick ? " *" : '',
                          style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.normal,
                              fontSize: 18))
                    ]),
                //textScaleFactor: labelTextScal
                textScaleFactor: 1,
                maxLines: 2,
              ),
            ],
          ),
          TextFormField(
              // autofocus: autofocus,
              onChanged: onChanged,
              readOnly: readOnly,
              onTap: onTap,
              keyboardType: keyboardType,
              controller: controller,
              decoration: InputDecoration(
                  hintText: hintText,

                  //labelText: label,
                  prefixIcon: prefix,
                  suffixIcon: suffix,
                  hintStyle:
                      const TextStyle(fontSize: 16, color: Colors.black87)
                  // contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  ),
              validator: validator),
        ],
      ),
    );
  }
}
