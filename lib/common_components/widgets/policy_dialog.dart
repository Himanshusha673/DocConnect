// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:doc_connect/modules/Auth/widgets/custom_text_button.dart';

class PolicyDialog extends StatelessWidget {
  String text;
  String titleText;
  bool isAboutApp;
  PolicyDialog({
    Key? key,
    required this.text,
    required this.titleText,
    required this.isAboutApp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Stack(
          children: [
            AlertDialog(
              title: Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: Text(titleText),
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      text,
                    ),
                    if (isAboutApp)
                      CustomTextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return PolicyDialog(
                                isAboutApp: false,
                                titleText: 'Privacy Policy',
                                text:
                                    'Privacy is very important to us, and we take it seriously. This privacy policy explains how we collect, use, and protect your personal information when you use our app.\n\nWe collect certain types of information from you when you use our app, such as your name, email address, and medical history. We use this information to provide you with the best possible experience while using our app, to improve our app, and to communicate with you about important updates or changes.\n\nWe will never share your personal information with any third parties without your consent, except as required by law or to comply with legal process. We use industry-standard security measures to protect your personal information from unauthorized access or disclosure.',
                              );
                            },
                          );
                        },
                        text: 'Privacy Policy',
                        fontSize: 14,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    if (isAboutApp)
                      CustomTextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return PolicyDialog(
                                isAboutApp: false,
                                titleText: 'Terms & Conditions',
                                text:
                                    'By using our app, you agree to these terms and conditions:\n\n● You must be 18 years or older to use our app.\n● You are responsible for providing accurate and complete information when using our app.\n● You agree to use our app only for lawful purposes.\n● You will not attempt to hack, disrupt, or damage our app or any of our servers.\n● We reserve the right to terminate your access to our app at any time for any reason.',
                              );
                            },
                          );
                        },
                        text: 'Terms & Conditions',
                        fontSize: 14,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    if (isAboutApp)
                      CustomTextButton(
                        onPressed: () {
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return PolicyDialog(
                          //       isAboutApp: false,
                          //       titleText: 'Terms & Conditions',
                          //       text:
                          //           'By using our app, you agree to these terms and conditions:\n\n● You must be 18 years or older to use our app.\n● You are responsible for providing accurate and complete information when using our app.\n● You agree to use our app only for lawful purposes.\n● You will not attempt to hack, disrupt, or damage our app or any of our servers.\n● We reserve the right to terminate your access to our app at any time for any reason.',
                          //     );
                          //   },
                          // );
                        },
                        text: 'Cookie Policy',
                        fontSize: 14,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    if (isAboutApp)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.copyright,
                            size: 16,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Copyright 2023-2024 Jatya Inc.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              actions: [
                Center(
                  child: CustomTextButton(
                    onPressed: () => Navigator.pop(context),
                    text: 'Close',
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.43,
              child: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
