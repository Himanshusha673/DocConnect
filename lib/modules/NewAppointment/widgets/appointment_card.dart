import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:doc_connect/common_components/widgets/map_icon.dart';
import 'package:doc_connect/modules/NewAppointment/model/get_clinic_detail_response.dart';
import 'package:doc_connect/modules/NewAppointment/screens/payment_screen.dart';
import 'package:doc_connect/modules/NewAppointment/services/appointment_repository.dart';

import '../model/appointment/get_slots_response.dart';
import '../model/doctors_via_location_response.dart';

class AppointmentCard extends StatefulWidget {
  final AvailableDoctor availableDoctor;
  final SlotDatum slot;
  final DateTime selectedDate;
  const AppointmentCard(
      {super.key,
      required this.slot,
      required this.selectedDate,
      required this.availableDoctor});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadiusDirectional.circular(8),
        clipBehavior: Clip.hardEdge,
        child: FutureBuilder<GetClinicDetailResponse?>(
            future: AppointmentRepository().getClinicDetail(
                clinicId: widget.availableDoctor.doctor.clinicId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: Column(
                    children: [
                      clinicDetail(clinic: snapshot.data!.data.clinic),
                      appointmentDetail(clinic: snapshot.data!.data.clinic),
                    ],
                  ),
                );
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }

  Widget clinicDetail({required Clinic clinic}) {
    return ClipPath(
      clipper: MyCustomClipperBottom(radius: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(clinic.logo),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    clinic.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Clinic ID ${widget.availableDoctor.doctor.clinicId}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${DateFormat("EEE").format(widget.slot.startTime)}, ${DateFormat("MMM").format(widget.slot.startTime)} ${widget.slot.startTime.day} | ${DateFormat("hh:mm a").format(widget.slot.startTime)} -${DateFormat("hh:mm a").format(widget.slot.endTime)} ",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appointmentDetail({required Clinic clinic}) {
    return ClipPath(
      clipper: MyCustomClipperTop(radius: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "₹ 500.00  ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "In-Person Consultation",
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${clinic.address} ${clinic.city}",
                            style: TextStyle(color: Colors.grey.shade700),
                          )
                        ],
                      )),
                  Expanded(
                      flex: 2,
                      child: Stack(
                        children: const [
                          MapIcon(),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.pin_drop_outlined,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(
                            availableDoctor: widget.availableDoctor,
                            clinic: clinic,
                            slot: widget.slot,
                            selectedDate: widget.selectedDate,
                          ),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Book Appointment"),
                    )))
          ],
        ),
      ),
    );
  }
}

class MyCustomClipperBottom extends CustomClipper<Path> {
  double radius;
  MyCustomClipperBottom({required this.radius});
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height - radius)
      ..arcToPoint(
        Offset(radius, size.height),
        radius: Radius.circular(radius.toDouble()),
      ) // Add line p1p2
      ..lineTo(size.width - radius, size.height)
      ..arcToPoint(Offset(size.width, size.height - radius),
          radius: Radius.circular(radius))
      ..lineTo(size.width, 0) // Add line p2p3
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MyCustomClipperTop extends CustomClipper<Path> {
  double radius;
  MyCustomClipperTop({required this.radius});
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, radius)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, radius)
      ..arcToPoint(Offset(size.width - radius, 0),
          radius: Radius.circular(radius))
      ..lineTo(radius, 0)
      ..arcToPoint(Offset(0, radius), radius: Radius.circular(radius))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
