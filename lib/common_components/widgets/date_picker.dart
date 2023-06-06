import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final String title;
  final bool isMandatory;
  final Function(DateTime) onChanged;
  final double? width;
  final String? initialDate;
  const DatePicker({
    super.key,
    required this.title,
    this.isMandatory = false,
    required this.onChanged,
    this.width,
    this.initialDate,
  });

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked =
        await showDatePicker(context: context, initialDate: selectedDate ?? DateTime.now(), firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      log("message");
      // setState(() {
      selectedDate = picked;
      widget.onChanged(selectedDate!);
      // });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    selectedDate = widget.initialDate != null ? DateTime.parse(widget.initialDate!) : null;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          _selectDate(context);
        },
        child: Container(
          width: widget.width ?? (MediaQuery.of(context).size.width / 1.8),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Row(
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    widget.isMandatory
                        ? const Text(
                            " *",
                            style: TextStyle(color: Colors.red),
                          )
                        : Container(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Container(
                  width: 350,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0.5,
                        color: Colors.grey.withOpacity(0.6),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      selectedDate != null ? Text(DateFormat("dd/MM/yyyy").format(selectedDate!)) : const Text("dd/mm/yyyy"),
                      const SizedBox(width: 29),
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
