import 'package:flutter/material.dart';
import 'package:jatya_patient_mobile/modules/Mediline/models/share_appointment_request.dart';
import 'package:jatya_patient_mobile/modules/Mediline/services/mediline_repository.dart';
import 'package:jatya_patient_mobile/modules/NewAppointment/model/get_clinic_detail_response.dart';
import 'package:jatya_patient_mobile/modules/NewAppointment/screens/payment_screen.dart';
import 'package:jatya_patient_mobile/utils/constants/color_konstants.dart';
import 'package:jatya_patient_mobile/utils/constants/image_konstants.dart';

import '../models/get_appointmens_response.dart';

class ShareWithClinicCard extends StatefulWidget {
  final Clinic clinic;
  final AppointmentDetail appointmentDetail;
  const ShareWithClinicCard({
    super.key,
    required this.clinic,
    required this.appointmentDetail,
  });

  @override
  State<ShareWithClinicCard> createState() => _ShareWithClinicCardState();
}

class _ShareWithClinicCardState extends State<ShareWithClinicCard> {
  bool isShared = false;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadiusDirectional.circular(8),
        clipBehavior: Clip.hardEdge,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.hardEdge,
          width: MediaQuery.of(context).size.width * 0.90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(padding: const EdgeInsets.only(top: 12), child: appointmentDetail()),
                ],
              ),
              shareButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget clinicDetail() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              const ProfileImage(image: ImagesConstants.clinicPlaceholder),
              Column(
                children: [
                  Text(widget.clinic.name),
                  Text("Clinic ID ${widget.clinic.id}"),
                  Text(widget.clinic.address),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget appointmentDetail() {
    return ClipPath(
      clipper: MyCustomClipperBottom(radius: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ProfileImage(scale: 0.2, image: widget.clinic.logo),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.clinic.name,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Clinic ID ${widget.clinic.id}",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.clinic.address,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget shareButton() {
    return ClipPath(
      clipper: MyCustomClipperTop(radius: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            // const SizedBox(
            //   height: 8,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isShared ? Colors.red : ColorKonstants.primaryColor,
                        ),
                        onPressed: () {
                          setState(() {
                            loading = true;
                          });
                          MedilineRepository()
                              .shareAppointment(
                                  shareAppointmentRequest: ShareAppointmentRequest(
                            appointmentId: widget.appointmentDetail.appointment.id,
                            clinicId: widget.clinic.id,
                            patientId: widget.appointmentDetail.appointment.patientId,
                          ))
                              .then((value) {
                            setState(() {
                              loading = false;
                              isShared = true;
                            });
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: loading
                              ? const CircularProgressIndicator()
                              : isShared
                                  ? const Text("Revoke Sharing")
                                  : const Text("Share with this clinic"),
                        ))),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
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
      ..arcToPoint(Offset(size.width, size.height - radius), radius: Radius.circular(radius))
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
      ..arcToPoint(Offset(size.width - radius, 0), radius: Radius.circular(radius))
      ..lineTo(radius, 0)
      ..arcToPoint(Offset(0, radius), radius: Radius.circular(radius))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
