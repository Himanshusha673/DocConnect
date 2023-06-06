import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doc_connect/modules/NewAppointment/bloc/appointment_bloc.dart';
import 'package:doc_connect/modules/NewAppointment/widgets/check_availability_widget.dart';
import 'package:doc_connect/modules/online_consultation/widgets/start_consultation_alert.dart';
import 'package:doc_connect/utils/constants/color_konstants.dart';
import 'package:doc_connect/utils/constants/image_konstants.dart';

import '../../NewAppointment/model/doctors_via_location_response.dart';
import 'doctor_detail_popup.dart';

enum DoctorDetailCardType {
  newAppointment,
  consultation,
}

class DoctorDetailCard extends StatefulWidget {
  final AvailableDoctor availableDoctor;
  final DoctorDetailCardType detailCardType;
  final DateTime selectedDate;
  const DoctorDetailCard({
    super.key,
    required this.availableDoctor,
    required this.detailCardType,
    required this.selectedDate,
  });

  @override
  State<DoctorDetailCard> createState() => _DoctorDetailCardState();
}

class _DoctorDetailCardState extends State<DoctorDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: ColorKonstants.cardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              width: 0.5, color: ColorKonstants.primarySwatch.shade100),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.175,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  doctorDetail(),
                  doctorDescription(),
                ],
              ),
            ),
            Row(
              children: [
                button(
                    text: 'More Details',
                    onPressed: () {
                      showPopup(
                          context: context,
                          child: DoctorDetailPopupWidget(
                            doctorId: widget.availableDoctor.doctor.id,
                            docUser: widget.availableDoctor.userData,
                            doctor: widget.availableDoctor.doctor,
                          ));
                    }),
                widget.detailCardType == DoctorDetailCardType.newAppointment
                    ? button(
                        text: 'Check Availability',
                        onPressed: () {
                          context.read<AppointmentBloc>().add(GetDoctorSlots(
                              doctor: widget.availableDoctor.doctor));
                          showPopup(
                              context: context,
                              child: CheckAvailability(
                                availableDoctor: widget.availableDoctor,
                                selectedDate: widget.selectedDate,
                              ));
                        })
                    : button(
                        text: 'Start Consultation',
                        onPressed: () {
                          showPopup(
                              context: context,
                              child: const StartConsulationAlertDialog());
                        }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget doctorDetail() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(ImagesConstants.doctor),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.availableDoctor.userData.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 18,
                      color: ColorKonstants.headingTextColor,
                    ),
                  ),
                  verifiedTag(context),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.availableDoctor.doctor.qualification,
                style: TextStyle(
                    fontSize: 12,
                    color: ColorKonstants.subHeadingTextColor.withOpacity(0.6)),
              ),
              // starsWidget(value: widget.doctor.stars),//TODO:rating
              starsWidget(value: 5)
            ],
          ),
        )
      ],
    );
  }

  Widget doctorDescription() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.availableDoctor.doctor.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
            color: ColorKonstants.subHeadingTextColor.withOpacity(0.6)),
      ),
    );
  }

  Widget button({
    required String text,
    required Function() onPressed,
  }) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            minimumSize: Size.zero,
            padding: const EdgeInsets.all(16),
            side: BorderSide(
                width: 0.5, color: ColorKonstants.primarySwatch.shade100),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  Widget starsWidget({required int value}) {
    int star = value > 5 ? 5 : value;
    List<Widget> starsList = [];
    for (int i = 0; i < star; i++) {
      starsList.add(const Padding(
        padding: EdgeInsets.all(0.0),
        child: Icon(
          size: 18,
          Icons.star_rounded,
          color: Colors.amber,
        ),
      ));
    }
    for (int i = 0; i < 5 - star; i++) {
      starsList.add(Padding(
        padding: const EdgeInsets.all(0.0),
        child: Icon(
          Icons.star_rounded,
          size: 18,
          color: Colors.grey.withOpacity(0.3),
        ),
      ));
    }
    return Row(
      children: starsList,
    );
  }
}

Widget verifiedTag(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
      decoration: BoxDecoration(
        color: ColorKonstants.verifiedBG,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
            width: 0.5, color: ColorKonstants.verifiedBorder.withOpacity(0.7)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_rounded,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 4),
          Text(
            'VERIFIED',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          const SizedBox(width: 4),
        ],
      ),
    ),
  );
}
