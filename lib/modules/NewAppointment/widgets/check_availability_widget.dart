import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jatya_patient_mobile/modules/NewAppointment/widgets/appointment_card.dart';
import 'package:jatya_patient_mobile/utils/constants/image_konstants.dart';

import '../../../utils/constants/color_konstants.dart';
import '../bloc/appointment_bloc.dart';
import '../model/doctors_via_location_response.dart';

class CheckAvailability extends StatefulWidget {
  final AvailableDoctor availableDoctor;
  final DateTime selectedDate;
  const CheckAvailability({
    super.key,
    required this.availableDoctor,
    required this.selectedDate,
  });

  @override
  State<CheckAvailability> createState() => _CheckAvailabilityState();
}

class _CheckAvailabilityState extends State<CheckAvailability> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    context.read<AppointmentBloc>().add(GetDoctorSlots(doctor: widget.availableDoctor.doctor));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          doctorDetail(),
          appointmentList(),
        ],
      ),
    );
  }

  Widget doctorDetail() {
    return Container(
      color: Colors.white.withOpacity(0.7),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "You are trying to book an appointment",
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey.shade700),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(image: AssetImage(ImagesConstants.doctor)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.availableDoctor.userData.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        verifiedTag(context),
                      ],
                    ),
                    Text(
                      widget.availableDoctor.doctor.qualification,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                    ),
                    starsWidget(value: 5), //TODO: docto rating,
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget appointmentList() {
    return BlocBuilder<AppointmentBloc, AppointmentState>(
      builder: (context, state) {
        log(state.toString());
        if (state is AppointmentDoctorCheckAvailabilityLoadingState) {
          return const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is AppointmentDoctorCheckAvailabilityState) {
          return Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                    children: state.slotList
                        .map((e) => AppointmentCard(
                              availableDoctor: widget.availableDoctor,
                              slot: e,
                              selectedDate: widget.selectedDate,
                            ))
                        .toList()),
              ),
            ),
          );
        }
        if (state is AppointmentDoctorSlotEmpty) {
          return const SizedBox(
            width: 500,
            height: 500,
            child: Text("No slots Available"),
          );
        }
        if (state is AppointmentErrorState) {
          return const SizedBox(
            width: 500,
            height: 500,
            child: Text("No slots Available"),
          );
        }
        return Container();
      },
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
    padding: const EdgeInsets.only(right: 5),
    child: Container(
      decoration: BoxDecoration(
        color: ColorKonstants.primarySwatch.shade100,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(width: 0.5, color: ColorKonstants.verifiedBorder.withOpacity(0.7)),
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
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
          ),
          const SizedBox(width: 4),
        ],
      ),
    ),
  );
}
