import 'package:flutter/material.dart';

class FAQQuestion extends StatefulWidget {
  final String question;
  final String answer;

  const FAQQuestion({
    super.key,
    required this.answer,
    required this.question,
  });

  @override
  State<FAQQuestion> createState() => _FAQQuestionState();
}

class _FAQQuestionState extends State<FAQQuestion> {
  bool isExapanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            setState(() {
              isExapanded = !isExapanded;
            });
          },
          dense: true,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  isExapanded ? Icons.arrow_drop_down_rounded : Icons.arrow_right,
                  size: 32,
                ),
                Text(
                  widget.question,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          subtitle: isExapanded
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text(widget.answer),
                )
              : Container(),
        ),
        const Divider()
      ],
    );
  }
}
