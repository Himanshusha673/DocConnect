import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jatya_patient_mobile/common_components/widgets/link_text.dart';
import 'package:jatya_patient_mobile/common_components/widgets/dropdown.dart';

class DiscountPopup extends StatefulWidget {
  const DiscountPopup({super.key});

  @override
  State<DiscountPopup> createState() => _DiscountPopupState();
}

class _DiscountPopupState extends State<DiscountPopup> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.hardEdge,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white60,
          ),
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              field(
                title: "ENTER AMOUNT",
                textField: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const[
                      Text(
                        "₹",
                        style: TextStyle(fontSize: 24, color: Colors.yellow),
                      ),
                    ],
                  )),
                ),
              ),
              DropDownWidget(
                  title: "SELECT REASON", selectedItem: const DropDownItem(name: "Others"), options:const [DropDownItem(name: "Others")], onChanged: (value) {}),
              field(
                  title: "ENTER REASON",
                  textField: const TextField(
                    maxLines: 2,
                    decoration: InputDecoration(hintText: "Enter"),
                  )),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Add Discount"),
                ),
              ),
              LinkText(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: "Cancel")
            ],
          )),
    );
  }

  Widget field({
    required String title,
    required TextField textField,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          textField,
        ],
      ),
    );
  }
}
