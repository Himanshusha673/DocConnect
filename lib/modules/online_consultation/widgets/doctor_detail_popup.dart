import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jatya_patient_mobile/modules/NewAppointment/model/doctor/doctor-detail_response.dart';
import 'package:jatya_patient_mobile/modules/NewAppointment/model/doctors_via_location_response.dart';
import 'package:jatya_patient_mobile/modules/NewAppointment/services/appointment_repository.dart';
import 'package:jatya_patient_mobile/modules/online_consultation/widgets/doctor_card.dart';
import 'package:jatya_patient_mobile/common_components/widgets/dropdown.dart';
import 'package:jatya_patient_mobile/utils/constants/color_konstants.dart';
import 'package:jatya_patient_mobile/utils/constants/image_konstants.dart';

class DoctorDetailPopupWidget extends StatefulWidget {
  final String doctorId;
  final Doctor doctor;
  final UserData docUser;
  const DoctorDetailPopupWidget({super.key, required this.doctorId, required this.docUser, required this.doctor});

  @override
  State<DoctorDetailPopupWidget> createState() => _DoctorDetailPopupWidgetState();
}

class _DoctorDetailPopupWidgetState extends State<DoctorDetailPopupWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DoctorDetailResponse?>(
        future: AppointmentRepository().getDcotorDetail(doctorId: widget.doctorId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          DoctorDetail doctor = snapshot.data!.data.doctor;
          List<DoctorWorkingHour> workingHourList = snapshot.data!.data.workingHours;
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 36.0),
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.hardEdge,
                  color: Colors.white,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        doctorDetail(doctor),
                        doctorContactDetail(doctor),
                        consultingHours(workingHourList),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 4,
                  left: 24,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade100,
                        width: 4.0,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(ImagesConstants.doctor),
                    ),
                  ))
            ],
          );
        });
  }

  Widget doctorDetail(DoctorDetail doctorDetail) {
    return Container(
      color: ColorKonstants.greyBG,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.docUser.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorKonstants.subHeadingTextColor,
                  ),
                ),
                verifiedTag(context)
              ],
            ),
            Text(
              widget.doctor.qualification,
              style: TextStyle(
                color: ColorKonstants.subHeadingTextColor.withOpacity(0.6),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget doctorContactDetail(DoctorDetail doctorDetail) {
    // each contact info tile
    Widget detailTile({
      required String title,
      required IconData iconData,
    }) {
      return ListTile(
        dense: true,
        horizontalTitleGap: 0,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        leading: Icon(
          iconData,
          size: 24,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 14, color: ColorKonstants.subHeadingTextColor.withOpacity(0.6)),
        ),
      );
    }

    return Column(
      children: [
        const SizedBox(height: 8),
        detailTile(title: widget.docUser.phoneNumber, iconData: Icons.phone_outlined),
        detailTile(title: widget.docUser.email, iconData: Icons.email_outlined),
        detailTile(
          title: "${widget.docUser.address}, ${widget.docUser.city}, ${widget.docUser.state}, ${widget.docUser.country}",
          iconData: Icons.location_on_outlined,
        ),
        const Divider(
          indent: 24,
          endIndent: 24,
        ),
      ],
    );
  }

  Widget consultingHours(List<DoctorWorkingHour> doctorWorkingHours) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    "CONSULTING HOURS",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: ColorKonstants.subHeadingTextColor.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: DropDownWidget(
                    selectedItem: const DropDownItem(name: "Neurowell Clinic"),
                    options: const [DropDownItem(name: "Neurowell Clinic")],
                    onChanged: (value) {},
                  )),
              Column(
                  children: doctorWorkingHours
                      .map((e) => timingTile(
                          day: e.weekday, time: "${DateFormat('hh:mm a').format(e.startTime)} - ${DateFormat('hh:mm a').format(e.endTime)}"))
                      .toList()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Close",
                        style: TextStyle(fontWeight: FontWeight.w700, decoration: TextDecoration.underline, color: ColorKonstants.textcolor),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget timingTile({
    required String day,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: MediaQuery.of(context).size.width * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Text(
              day,
              style: TextStyle(fontWeight: FontWeight.bold, color: ColorKonstants.subHeadingTextColor.withOpacity(0.6), fontSize: 12),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Text(
              time,
              textAlign: TextAlign.left,
              style: TextStyle(color: ColorKonstants.subHeadingTextColor.withOpacity(0.6), fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}

// showDoctorDetailPopup(BuildContext context) {
//   // show the dialog
//   showPopup(context: context, child: const DoctorDetailPopupWidget());
// }
