import 'package:flutter/material.dart';
import 'package:doc_connect/common_components/widgets/common_drawer.dart';
import 'package:doc_connect/common_components/widgets/link_text.dart';
import 'package:doc_connect/modules/Faq/widgets/faq_qestion_widget.dart';

import '../../../common_components/widgets/policy_dialog.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CommonDrawer(),
      appBar: AppBar(
        title: const Text("FAQ"),
        actions: [
          LinkText(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return PolicyDialog(
                    isAboutApp: false,
                    titleText: 'Help',
                    text:
                        'If you need help with our app, please don\'t hesitate to contact our support team. You can reach us by email or through the in-app help center.\n\nOur support team is available 24/7 to assist you with any issues or questions you may have. We\'re here to help you get the most out of our app and ensure that your experience is as smooth and seamless as possible.',
                  );
                },
              );
            },
            text: "Need help?",
          ),
        ],
      ),
      body: Column(
        children: const [
          FAQQuestion(
            question: "Question #1",
            answer:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis viverra commodo metus, ut volutpat augue gravida posuere. In a augue vel felis fringilla fringilla non ac ex. Nam vehicula neque a dolor cursus, dapibus fermentum justo sodales. Maecenas at malesuada eros, et mattis.",
          ),
          FAQQuestion(
            question: "Question #2",
            answer:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis viverra commodo metus, ut volutpat augue gravida posuere. In a augue vel felis fringilla fringilla non ac ex. Nam vehicula neque a dolor cursus, dapibus fermentum justo sodales. Maecenas at malesuada eros, et mattis.",
          ),
          FAQQuestion(
            question: "Question #3",
            answer:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis viverra commodo metus, ut volutpat augue gravida posuere. In a augue vel felis fringilla fringilla non ac ex. Nam vehicula neque a dolor cursus, dapibus fermentum justo sodales. Maecenas at malesuada eros, et mattis.",
          )
        ],
      ),
    );
  }
}
