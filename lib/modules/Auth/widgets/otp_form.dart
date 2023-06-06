// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:doc_connect/utils/constants/color_konstants.dart';

class OTPForm extends StatefulWidget {
  double width;
  double height;
  Function(String) onChanged;
  OTPForm({
    Key? key,
    required this.width,
    required this.height,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  String entertedOtp = "";
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log("${otp1.text}   ${otp2.text}");
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildSingleTextField(
            context: context,
            width: widget.width,
            height: widget.height,
            newValue: (val) {},
            controller: otp1,
          ),
          buildSingleTextField(
            context: context,
            width: widget.width,
            height: widget.height,
            newValue: (val) {
              entertedOtp += val;
            },
            controller: otp2,
          ),
          buildSingleTextField(
            context: context,
            width: widget.width,
            height: widget.height,
            newValue: (val) {},
            controller: otp3,
          ),
          buildSingleTextField(
            context: context,
            width: widget.width,
            height: widget.height,
            newValue: (val) {},
            controller: otp4,
          ),
          buildSingleTextField(
            context: context,
            width: widget.width,
            height: widget.height,
            newValue: (val) {},
            controller: otp5,
          ),
          buildSingleTextField(
            context: context,
            width: widget.width,
            height: widget.height,
            newValue: (val) {
              widget.onChanged(otp1.text +
                  otp2.text +
                  otp3.text +
                  otp4.text +
                  otp5.text +
                  otp6.text);
            },
            controller: otp6,
          ),
        ],
      ),
    );
  }

  Widget buildSingleTextField({
    required BuildContext context,
    required double width,
    required double height,
    required Function(String) newValue,
    required TextEditingController controller,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        onChanged: (value) {
          setState(() {});
          if (value.length == 1) {
            newValue(value);
            FocusScope.of(context).nextFocus();
          }
        },
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: controller.text.isNotEmpty
                  ? ColorKonstants.primarySwatch.shade400
                  : Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
