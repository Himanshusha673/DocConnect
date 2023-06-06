// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jatya_patient_mobile/common_components/widgets/popup_widget.dart';

import 'package:jatya_patient_mobile/modules/Auth/screens/login_screen.dart';
import 'package:jatya_patient_mobile/modules/Auth/widgets/custom_text_button.dart';
import 'package:jatya_patient_mobile/modules/Auth/widgets/otp_form.dart';

import '../../../common_components/widgets/error_alert_dialog.dart';
import '../../../utils/constants/image_konstants.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/terms_and_copyright_widget.dart';

class EnterOTPScreen extends StatefulWidget {
  final String otpSentAddress;
  final String screenTitle;
  final String promptTitle;
  final String buttonText;
  Future<String> Function(BuildContext, String) onButtonPressed;
  EnterOTPScreen({
    Key? key,
    required this.otpSentAddress,
    required this.screenTitle,
    required this.promptTitle,
    required this.buttonText,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  State<EnterOTPScreen> createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> {
  String otp = "";
  @override
  Widget build(BuildContext context) {
    var devicesize = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  ImagesConstants.jatyaLogoName,
                  height: devicesize.height / 14,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '${widget.promptTitle} ${widget.otpSentAddress}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      text: 'change',
                      fontSize: 14,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'ENTER OTP',
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                OTPForm(
                  width: 48,
                  height: 44,
                  onChanged: (value) {
                    setState(() {
                      otp = value;
                      print("Otp=$otp");
                    });
                  },
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                CustomElevatedButton(
                  onPressed: () async {
                    if (otp.length < 6) {
                      showPopup(context: context, child: const ErrorAlertDialog(error: "Enter a valid otp"));
                    } else {
                      String error = await widget.onButtonPressed(context, otp);
                      log("message$error");

                      if (error != "") {
                        showPopup(context: context, child: ErrorAlertDialog(error: error));
                      }
                    }
                  },
                  horizontalWidth: width * 0.36,
                  verticalWidth: 12,
                  text: widget.buttonText,
                ),
                CustomTextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  text: 'Resend OTP',
                  fontSize: 14,
                ),
                SizedBox(
                  height: height * 0.28,
                ),
                ...buildTermsAndCopyrightWidget(
                  termsOnPressed: () {},
                  privacyOnPressed: () {},
                  cookieOnPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
