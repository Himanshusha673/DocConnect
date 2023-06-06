import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jatya_patient_mobile/modules/Mediline/models/get_appointmens_response.dart';

import '../../../common_components/widgets/label.dart';
import '../../../common_components/widgets/map_icon.dart';
import '../../../utils/constants/color_konstants.dart';
import '../../../utils/constants/image_konstants.dart';
import '../../MyJatya/bloc/upcoming_apppointment/upcoming_appointmen_bloc.dart';
import '../../NewAppointment/screens/payment_screen.dart';

class MedilineUpcomingAppointmentPopupWidget extends StatefulWidget {
  final AppointmentDetail appointmentDetail;
  final void Function()? onCancelAppointmentSuccess;
  const MedilineUpcomingAppointmentPopupWidget(
      {super.key,
      required this.appointmentDetail,
      required this.onCancelAppointmentSuccess});

  @override
  State<MedilineUpcomingAppointmentPopupWidget> createState() =>
      _MedilineUpcomingAppointmentPopupWidgetState();
}

class _MedilineUpcomingAppointmentPopupWidgetState
    extends State<MedilineUpcomingAppointmentPopupWidget> {
  final UpcomingAppointmenBloc _upcomingAppointmenBloc =
      UpcomingAppointmenBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpcomingAppointmenBloc, UpcomingAppointmenState>(
      bloc: _upcomingAppointmenBloc,
      listenWhen: (previous, current) => current is AppointmentActionState,
      buildWhen: (previous, current) => current is! AppointmentActionState,
      listener: (context, state) {
        if (state is CancelAppointAndNavigatePop) {
          widget.onCancelAppointmentSuccess!.call();
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Appointment Cancelled'),
              duration: Duration(seconds: 3),
            ),
          );
        } else if (state is CancelAppointmentFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Appointment not Cancelled'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        // if (state is UpcomingAppointmenloading) {
        //   log("In 2");
        //   return const Center(child: CircularProgressIndicator());
        // } else if (state is UpcomingAppointmenSuccess) {
        //   log("In 3");
        return body(context, widget.appointmentDetail);
        // } else if (state is UpcomingAppointmeFailure) {
        //   log("In 4");
        //   return body(context, null);
        // } else {
        //   return const Center(child: CircularProgressIndicator());
        // }
      },
    );
  }

  Widget body(BuildContext context, AppointmentDetail getAllAppointments) {
    Appointment? appointmentModel = getAllAppointments.appointment;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadiusDirectional.circular(80),
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
                  Container(
                      padding: const EdgeInsets.only(top: 48),
                      child: appointmentDetail(appointmentModel)),
                ],
              ),
              clinicDetail(appointmentModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget appointmentDetail(Appointment? appointmentsDetailsData) {
    String appointmentDate = "Tue, Dec 6 ";
    String appointmentStartTime = "6:30";
    String appointmentendTime = "7:30 AM";
    if (appointmentsDetailsData != null) {
      appointmentDate = getSplitedDateAndTimeString(
          appointmentsDetailsData.appointmentDate.toString(), true);
      appointmentStartTime = getSplitedDateAndTimeString(
          appointmentsDetailsData.startTime.toString(), false);
      appointmentendTime = getSplitedDateAndTimeString(
          appointmentsDetailsData.endTime.toString(), false);
    }

    return ClipPath(
      clipper: MyCustomClipperBottom(radius: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: ColorKonstants.greyBG,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                  flex: 2,
                  child: ProfileImage(
                      scale: 0.2, image: ImagesConstants.ladyDocImage),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        appointmentsDetailsData?.title ?? "Dr. Aditi Sharma",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        appointmentsDetailsData?.speciality ?? "Urologist",
                        style: TextStyle(
                          color: ColorKonstants.headingTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              appointmentDate,
                              style: TextStyle(
                                color: ColorKonstants.headingTextColor,
                              ),
                            ),
                            const VerticalDivider(
                              thickness: 2,
                              width: 2,
                              color: Colors.black,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    appointmentStartTime,
                                    style: TextStyle(
                                      color: ColorKonstants.headingTextColor,
                                    ),
                                  ),
                                  Text(
                                    "-",
                                    style: TextStyle(
                                      color: ColorKonstants.headingTextColor,
                                    ),
                                  ),
                                  Text(
                                    appointmentendTime,
                                    style: TextStyle(
                                      color: ColorKonstants.headingTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Stars(value: 5),
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

  Widget clinicDetail(Appointment? appointmentsDetails) {
    return ClipPath(
      clipper: MyCustomClipperTop(radius: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage(
                        ImagesConstants.qrPlaceholder,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Label(
                          color: Colors.green,
                          label: Row(
                            children: const [
                              Icon(
                                Icons.check_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "PAID",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ],
                          ),
                          context: context,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "In-Person Consultation",
                          style: TextStyle(
                            color: ColorKonstants.headingTextColor,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Neurowell Clinic, Skydale, Bangalore",
                        style: TextStyle(
                          color: ColorKonstants.headingTextColor,
                        ),
                      ),
                    )
                  ],
                ),
                const Align(alignment: Alignment.centerRight, child: MapIcon())
              ],
            ),
            const SizedBox(height: 16),
            ListTile(
              dense: true,
              leading: const Icon(Icons.watch),
              title: Text(
                "Save your time at the clinic by syncing your data directly from your Smartwatch",
                style: TextStyle(
                  color: ColorKonstants.headingTextColor,
                ),
              ),
              trailing: SizedBox(
                width: 45,
                child: Row(
                  children: [
                    Icon(
                      Icons.sync,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                    const Text(
                      "Sync",
                      style: TextStyle(
                          color: ColorKonstants.blueccolor, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.red,
                        ),
                        backgroundColor: Colors.transparent),
                    onPressed: () {
                      _upcomingAppointmenBloc.add(
                          CancelUpcomingAppointmentEvent(
                              appointmentId: appointmentsDetails!.id));
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Cancel Appointment",
                        style: TextStyle(color: Colors.red),
                      ),
                    ))),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Back to my mediline ",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black),
                )),
            const SizedBox(
              height: 8,
            )
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

String getSplitedDateAndTimeString(String msg, bool IsDate) {
  String dateString = msg;
  DateTime dateTime = DateTime.parse(dateString);
  String time = "";

  if (IsDate) {
    // Extract date using the DateFormat class
    time = DateFormat.yMd().format(dateTime);
  } else {
    // Extract hours and minutes using the DateFormat class
    time = DateFormat.Hm().format(dateTime);
  }

  return time;
}
