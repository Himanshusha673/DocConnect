import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doc_connect/common_components/widgets/popup_widget.dart';
import 'package:doc_connect/modules/MyJatya/widgets/upcoming_appointment_recipt.dart';
import 'package:doc_connect/modules/MyPrescription/bloc/get_prescription_bloc_bloc.dart';
import 'package:doc_connect/modules/MyPrescription/models/latest_prescription.dart';
import 'package:doc_connect/modules/MyPrescription/screens/prescription_detail_tabview.dart';
import 'package:doc_connect/modules/Reports/screens/main_report_screen.dart';
import 'package:doc_connect/utils/SharePref.dart';
import 'package:doc_connect/utils/constants/color_konstants.dart';
import 'package:doc_connect/utils/helper/helper.dart';

import '../../../common_components/widgets/common_drawer.dart';
import '../../../utils/constants/image_konstants.dart';
import '../bloc/upcoming_apppointment/upcoming_appointmen_bloc.dart';

class MyJatya extends StatefulWidget {
  const MyJatya({super.key});

  @override
  State<MyJatya> createState() => _MyJatyaState();
}

class _MyJatyaState extends State<MyJatya> {
  final String currentDateString =
      DateFormat("dd MMMM yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    // var devicesize = MediaQuery.of(context).size;
    return BlocListener<UpcomingAppointmenBloc, UpcomingAppointmenState>(
      listener: (context, state) {
        print("state is $state");
        if (state is UpcomingAppointmenloading) {
          showDialog(
              context: context,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()));
          log("loading in getting upcoming appointment details");
        }
        if (state is UpcomingAppointmeFailure) {
          Navigator.pop(context);
          WidgetHelper.showToast(state.err);
        }
        if (state is UpcomingAppointmenSuccess) {
          Navigator.pop(context);
          showPopup(
              context: context,
              child: UpcomingAppointmentRecipt(
                  getAllAppointment: state.getAllAppointments));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("My Jatya"),
          centerTitle: false,
        ),
        drawer: const CommonDrawer(),
        body: Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "WELCOME BACK, ",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    sharedPrefs.name ?? "EHSAAN",
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  print("clicked on icon");
                  BlocProvider.of<UpcomingAppointmenBloc>(context)
                      .add(GetUpcomingApppointmentEvent());
                },
                child: jatyaItems(ImagesConstants.appointmentDrawer,
                    "UPCOMING APPOINTMENT", "On $currentDateString", () {
                  // showPopup(
                  //     context: context,
                  //     child: const UpcomingAppointmentRecipt());
                  // BlocProvider.of<UpcomingAppointmenBloc>(context)
                  //     .add(GetUpcomingApppointmentEvent());
                }),
              ),
              const SizedBox(
                height: 15,
              ),
              BlocListener<GetPrescriptionBlocBloc, GetPrescriptionBlocState>(
                listener: (context, state) {
                  if (state is GetPrescriptionBlocloading) {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            const Center(child: CircularProgressIndicator()));

                    log("loading in getting prescription");
                  }
                  if (state is GetPrescriptionBlocFailure) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("There is no prescription available"),
                    ));
                  }
                  if (state is GetPrescriptionBlocSuccess) {
                    Navigator.pop(context);
                    GetAllPrecriptionResposnse getAllPrecriptionResposnse =
                        state.getAllPrescriptions;
                    GetAllPrescriptionData? getAllPrescriptionData =
                        getAllPrecriptionResposnse.data!.first;
                    if (getAllPrecriptionResposnse.data != null) {
                      getAllPrescriptionData.createdDate =
                          findNearestDate(getAllPrecriptionResposnse.data);
                    }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PrescriptionDetailTabview(
                          getAllPrescriptionData: getAllPrescriptionData);
                    }));
                  }
                },
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<GetPrescriptionBlocBloc>(context)
                        .add(GetAllPrescriptionEvent());
                  },
                  child: jatyaItems(
                      ImagesConstants.prescriptionDrawer,
                      "LATEST PRESCRIPTION",
                      "Appointment Date - Dec 30, 2022",
                      () {}),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainReportsScreen(),
                    ),
                  );
                },
                child: jatyaItems(
                    ImagesConstants.reportDrawer,
                    "RECENT REPORTS",
                    "Blood test- Sugar level, Creatinine...", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainReportsScreen(),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget jatyaItems(
      String myImage, String title, String subtitle, VoidCallback clicked) {
    return Container(
      width: 366,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorKonstants.tileBackGround,
          border: Border.all(color: Colors.black, width: 0.2)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.calendar_month,
            //   color: Colors.black,
            //   size: 25,
            // ),

            SvgPicture.asset(
              myImage,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: ColorKonstants.textcolor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: Text(
                    subtitle,
                    style: const TextStyle(color: Colors.black54),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10, left: 20),
              child: SizedBox(
                  height: 30,
                  width: 30,
                  child: InkWell(
                      hoverColor: ColorKonstants.textcolor,
                      focusColor: ColorKonstants.textcolor,
                      highlightColor: ColorKonstants.textcolor,
                      // Image tapped
                      splashColor: Colors.white, // Splash color over image
                      child: Image(
                          color: ColorKonstants.primarySwatch,
                          image:
                              AssetImage(ImagesConstants.rightArrowOutlined)))),
            ),
          ],
        ),
      ),
    );
  }

  String findNearestDate(List<GetAllPrescriptionData>? data) {
    DateTime now = DateTime.now();
    DateTime nearestDate = DateTime.parse(data!.first.createdDate!);

    for (var prescription in data) {
      log(prescription.createdDate.toString());
      DateTime? currentDate = prescription.createdDate != null
          ? DateTime.parse(prescription.createdDate!)
          : null;

      if (currentDate != null) {
        Duration diff1 = now.difference(currentDate).abs();
        Duration diff2 = now.difference(nearestDate).abs();

        if (diff1 < diff2) {
          nearestDate = currentDate;
          log(nearestDate.toString());
        }
      }
    }
    GetAllPrescriptionData nearestPrescription = data.firstWhere(
      (prescription) =>
          DateTime.parse(prescription.createdDate!) == nearestDate,
    );

    return nearestDate.toString();
  }
}
