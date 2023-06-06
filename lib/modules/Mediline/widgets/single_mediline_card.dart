import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jatya_patient_mobile/modules/Mediline/models/get_appointmens_response.dart';
import 'package:jatya_patient_mobile/modules/Mediline/widgets/mediline_card.dart';
import 'package:jatya_patient_mobile/utils/constants/color_konstants.dart';

import '../../../utils/constants/image_konstants.dart';

class SingleMedilineCard extends StatefulWidget {
  final AppointmentDetail appointmentDetail;
  const SingleMedilineCard({super.key, required this.appointmentDetail});

  @override
  State<SingleMedilineCard> createState() => _SingleMedilineCardState();
}

class _SingleMedilineCardState extends State<SingleMedilineCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 0.5,
              color: Colors.grey,
            ),
            color: Colors.white38.withOpacity(0.8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _detail(),
              Row(
                children: [
                  Container(
                    width: 0.5,
                    height: 100,
                    color: Colors.grey,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  _date(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detail() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.appointmentDetail.appointment.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: Text(
                  widget.appointmentDetail.appointment.chiefComplaint,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: const [
              ImageIconBox(image: ImagesConstants.docPlaceholder),
              ImageIconBox(image: ImagesConstants.clinicPlaceholder),
              ImageIconBox(image: ImagesConstants.docPlaceholder),
              ImageIconBox(image: ImagesConstants.docPlaceholder),
            ],
          )
        ],
      ),
    );
  }

  Widget _date() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            DateFormat('MMM').format(widget.appointmentDetail.appointment.appointmentDate).toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Text(
            DateFormat('dd').format(widget.appointmentDetail.appointment.appointmentDate).toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Text(
            DateFormat('yyyy').format(widget.appointmentDetail.appointment.appointmentDate).toUpperCase(),
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: ColorKonstants.subHeadingTextColor),
          ),
        ],
      ),
    );
  }
}
