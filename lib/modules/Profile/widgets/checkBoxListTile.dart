import 'package:flutter/material.dart';
import 'package:jatya_patient_mobile/utils/constants/color_konstants.dart';

class MyCheckboxListTile extends StatefulWidget {
  final String title;
  bool checked;
  final Function(bool) onChanged;

  MyCheckboxListTile({
    super.key,
    required this.title,
    required this.checked,
    required this.onChanged,
  });

  @override
  _MyCheckboxListTileState createState() => _MyCheckboxListTileState();
}

class _MyCheckboxListTileState extends State<MyCheckboxListTile> {
  bool _checked = false;

  @override
  void initState() {
    super.initState();
    _checked = widget.checked;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title),
      value: _checked,
      activeColor: ColorKonstants.verifiedBorder,
      onChanged: (bool? value) {
        setState(() {
          _checked = value!;
          widget.onChanged(_checked);
        });
      },
    );
  }
}
