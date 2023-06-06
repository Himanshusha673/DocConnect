import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doc_connect/modules/MyPrescription/bloc/prescription_deatils/prescription_details_bloc.dart';
import 'package:doc_connect/modules/MyPrescription/models/latest_prescription.dart';
import 'package:doc_connect/modules/MyPrescription/models/prescription_deatils/prescription_details.dart';
import 'package:doc_connect/modules/MyPrescription/screens/about_the_clinic.dart';
import 'package:doc_connect/modules/MyPrescription/screens/doctors_profile.dart';
import 'package:doc_connect/modules/MyPrescription/screens/prescription.dart';
import 'package:doc_connect/modules/MyPrescription/screens/report.dart';
import 'package:doc_connect/utils/constants/color_konstants.dart';
import 'package:doc_connect/utils/constants/image_konstants.dart';
import 'package:url_launcher/url_launcher.dart';

class PrescriptionDetailTabview extends StatefulWidget {
  PrescriptionDetailTabview({super.key, required this.getAllPrescriptionData});
  GetAllPrescriptionData getAllPrescriptionData;

  @override
  State<PrescriptionDetailTabview> createState() =>
      _PrescriptionDetailTabviewState();
}

class _PrescriptionDetailTabviewState extends State<PrescriptionDetailTabview> {
  final PrescriptionDetailsBlocBloc _getPrescriptionDetailsBloc =
      PrescriptionDetailsBlocBloc();
  @override
  void initState() {
    _getPrescriptionDetailsBloc.add(GetPrescriptionDetailsEvent(
      appointmentID: widget.getAllPrescriptionData.appointmentId!,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _getPrescriptionDetailsBloc.close();
    super.dispose();
  }

  Future<void> _launchURL(String url) async {
    log(url);
    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        log("yes launched");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double widthOfdevice = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AppBar(
                    // backgroundColor: ColorKonstants.primarySwatch,
                    actions: [
                      PopupMenuButton(
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              value: 'item1',
                              child: ListTile(
                                selected: true,
                                onTap: () {},
                                leading: const Padding(
                                  padding: EdgeInsets.only(right: 18.0),
                                  child: Icon(Icons.menu_sharp,
                                      color: ColorKonstants.primarySwatch),
                                ),
                                title: const Text(
                                  'Summary View',
                                  style: TextStyle(color: Colors.black26),
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              value: 'item2',
                              child: ListTile(
                                selected: true,
                                onTap: () {},
                                leading: const Padding(
                                  padding: EdgeInsets.only(right: 18.0),
                                  child: Icon(Icons.credit_card,
                                      color: ColorKonstants.primarySwatch),
                                ),
                                title: const Text(
                                  'Detailed View',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              value: 'item3',
                              child: ListTile(
                                selected: true,
                                onTap: () {},
                                leading: const Padding(
                                  padding: EdgeInsets.only(right: 18.0),
                                  child: Icon(Icons.share,
                                      color: ColorKonstants.primarySwatch),
                                ),
                                title: const Text(
                                  'Share Details with…',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              value: 'item4',
                              child: ListTile(
                                selected: true,
                                onTap: () {
                                  _getPrescriptionDetailsBloc.add(
                                      DownloadPrescriptionDetailsEvent(
                                          prescriptionId: widget
                                              .getAllPrescriptionData.id!));
                                },
                                leading: const Padding(
                                  padding: EdgeInsets.only(right: 18.0),
                                  child: Icon(Icons.file_download,
                                      color: ColorKonstants.primarySwatch),
                                ),
                                title: const Text(
                                  'Download Prescription',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ];
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    left: widthOfdevice * 0.200,
                    child: const CircleAvatar(
                      radius: 20.0,
                      backgroundImage:
                          AssetImage(ImagesConstants.clinicPlaceholder),
                    ),
                  ),
                  Positioned(
                    left: widthOfdevice * 0.145,
                    child: const CircleAvatar(
                      radius: 20.0,
                      backgroundImage:
                          AssetImage(ImagesConstants.circleavatar2),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: widthOfdevice * 0.310,
                    child: const Text(
                      "Visit types goes here",
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                  ),
                  Positioned(
                      top: 35,
                      left: widthOfdevice * 0.310,
                      child: Text(
                        "${widget.getAllPrescriptionData.createdDate}",
                        style: const TextStyle(
                            fontSize: 12, color: Colors.white60),
                      )),
                ],
              ),
            ),
            body: BlocListener<PrescriptionDetailsBlocBloc,
                    PrescriptionDetailsBlocState>(
                bloc: _getPrescriptionDetailsBloc,
                listenWhen: (previous, current) =>
                    current is PrescriptionDetailsActionBlocState,
                listener: (context, state) {
                  if (state is PrescriptionDownloadBlocLoading) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(microseconds: 200),
                        backgroundColor: ColorKonstants.primarySwatch,
                        content: Column(
                          children: const [
                            LinearProgressIndicator(),
                            SizedBox(height: 5),
                            Text('Downloading prescription...'),
                          ],
                        ),
                      ),
                    );
                  } else if (state is PrescriptionDownlaodBlocFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: ColorKonstants.primarySwatch,
                        content: Text('Failed to download prescription.'),
                      ),
                    );
                  } else if (state is PrescriptionDownloadBlocSuccess) {
                    _launchURL(state.prescriptionPdfurl);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: ColorKonstants.primarySwatch,
                        content: Text(' Download Completed !!'),
                      ),
                    );
                  }
                },
                child: BlocBuilder<PrescriptionDetailsBlocBloc,
                    PrescriptionDetailsBlocState>(
                  bloc: _getPrescriptionDetailsBloc,
                  buildWhen: (previous, current) =>
                      current is! PrescriptionDetailsActionBlocState,
                  builder: (context, state) {
                    if (state is PrescriptionDetailsBlocLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is PrescriptionDetailsBlocSuccess) {
                      return body(context, state.prescriptionDetails);
                    } else if (state is PrescriptionDetailsBlocFailure) {
                      return body(context, null);
                    } else {
                      return const Center(child: Text("Something went wrong"));
                    }
                  },
                ))));

    // body(context, getAllPrescriptionData)));
  }

  Widget body(BuildContext context, PrescriptionDetails? prescriptionDetails) {
    double widthOfdevice = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Expanded(
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                const TabBar(
                  isScrollable: true, // Make the tab bar scrollable
                  tabs: [
                    Tab(
                      text: 'Prescription',
                    ),
                    Tab(text: 'Reports'),
                    Tab(text: "Doctor's Profile"),
                    Tab(text: 'About the Clinic'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Prescription(
                        getAllPrescriptionData: widget.getAllPrescriptionData,
                      ),
                      const Report(),
                      DoctorsProfile(
                        doctorDetails: prescriptionDetails!.data!.doctor!,
                      ),
                      AbouttheClinicScreen(
                        clinicInformation: prescriptionDetails.data!.clinic,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
