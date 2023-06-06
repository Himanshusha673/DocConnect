import 'package:flutter/material.dart';

class PhoneNumberDropdownMenu extends StatefulWidget {
  const PhoneNumberDropdownMenu({super.key});

  @override
  State<PhoneNumberDropdownMenu> createState() => _PhoneNumberDropdownMenuState();
}

class _PhoneNumberDropdownMenuState extends State<PhoneNumberDropdownMenu> {
  List<String> countryCodes = [
    '🇺🇸',
    '🇬🇧',
    '🇮🇳',
  ];
  String selectedCountryCode = '🇮🇳';

  List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
    return countryCodes
        .map(
          (code) => DropdownMenuItem(
            value: code,
            child: Row(
              children: [
                Text(code),
                const SizedBox(width: 8),
                // Text(code),
              ],
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: DropdownButton(
        value: selectedCountryCode,
        onChanged: (value) {
          setState(() {
            selectedCountryCode = value!;
          });
        },
        items: _buildDropdownMenuItems(),
      ),
    );
  }
}
