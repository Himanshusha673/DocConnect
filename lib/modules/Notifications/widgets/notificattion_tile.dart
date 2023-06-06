import 'package:flutter/material.dart';
import 'package:jatya_patient_mobile/utils/constants/color_konstants.dart';

class NotificationTile extends StatefulWidget {
  final String title;
  final String subTitle;
  final IconData iconData;
  final bool isBold;
  const NotificationTile({
    super.key,
    required this.isBold,
    required this.title,
    required this.subTitle,
    required this.iconData,
  });

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      title: Text(
        widget.title,
        style: TextStyle(
            fontWeight: widget.isBold ? FontWeight.bold : FontWeight.normal),
        // "Upcoming Appointment",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        widget.subTitle,
        style: TextStyle(
            fontWeight: widget.isBold ? FontWeight.bold : FontWeight.normal),
        // "4 days to go"
      ),
      leading: Container(
        
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(100),
          border: Border.all(color: ColorKonstants.primarySwatch.shade100),
        ),
        child: Center(
          child: Icon(
            widget.iconData,
            size: 20,
          ),
        ),
        
      ),
      
    );
  }
}
