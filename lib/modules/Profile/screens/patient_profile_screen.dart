import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doc_connect/common_components/widgets/common_drawer.dart';
import 'package:doc_connect/modules/Profile/bloc/patientBloc/patient_bloc.dart';
import 'package:doc_connect/modules/Profile/bloc/patientBloc/patient_state.dart';
import 'package:doc_connect/modules/Profile/models/get_specific_patient_by_id/get_sprecific_patient_by_id.dart';
import 'package:doc_connect/modules/Profile/screens/patient_update_profile.dart';
import 'package:doc_connect/modules/Profile/widgets/expansioBox.dart';
import 'package:doc_connect/modules/Profile/widgets/patient_profile_header.dart';
import 'package:doc_connect/utils/SharePref.dart';
import 'package:doc_connect/utils/constants/image_konstants.dart';
import '../../../utils/constants/color_konstants.dart';
import '../bloc/patientBloc/patient_event.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({Key? key}) : super(key: key);

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<PatientBloc>(context).add(FetchPatientData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
        ),
        drawer: const CommonDrawer(),
        body: BlocBuilder<PatientBloc, PatientState>(
          builder: (context, state) {
            print(state);
            if (state is PatientLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PatientSuccessState) {
              log("yes succes in profile");
              return body(context, state.data!.data);
            } else if (state is PatientFailureState) {
              return const Center(child: Text('Unable to fetch user profile!'));
            } else {
              return const Center(child: Text('Something went wrong!'));
            }
          },
        ));
  }

  Widget body(BuildContext context, GetSpecificPatientDataById? patientData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const PatientProfileHeader(),
            const Padding(
              padding: EdgeInsets.only(right: 4.0, top: 15),
              child: Divider(thickness: 1),
            ),
            demographicsSection(context, patientData),
            const SizedBox(
              height: 24,
            ),
            //expansionBox(Icons.arrow_drop_down_sharp, "Allergies"),
            // expansionBoxData(
            //     allergieModel.data![0].medicineAllergies!, "Nil", "Nil"),
            // Align(
            // alignment: Alignment.centerLeft,
            // child:
            ExpansionList(
                question: "Allergies",
                answer: patientData!.allergies.isEmpty
                    ? GetSpecificPatientAllergydata(
                        foodAllergies: [],
                        medicineAllergies: [],
                        patientId: sharedPrefs.patientId,
                        petAllergies: [])
                    : patientData.allergies[0] ??
                        GetSpecificPatientAllergydata(
                            foodAllergies: [],
                            medicineAllergies: [],
                            patientId: sharedPrefs.patientId,
                            petAllergies: [])),
            // ),
            expansionBox(Icons.arrow_right, "Vaccinations"),

            expansionBox(Icons.arrow_right, "Previous Reports"),

            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Divider(thickness: 2),
            ),
            const SizedBox(
              height: 10,
            ),
            textHeading("CLINIC I HAVE VISITED"),
            const SizedBox(
              height: 20,
            ),
            clinicDetails("Neurowell", "JTY003", "ORTHODONTICS …"),
            const SizedBox(
              height: 10,
            ),
            clinicDetails("Orthocare", "JTY003", "ORTHODONTICS …"),
            const SizedBox(
              height: 10,
            ),
            clinicDetails("A1 Dental Clinic", "JTY003", "ORTHODONTICS …"),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Divider(thickness: 2),
            ),
            const SizedBox(
              height: 10,
            ),
            //for text Headings
            textHeading(" APP DETAILS "),
            const SizedBox(
              height: 20,
            ),
            appDeatils(context)
          ],
        ),
      ),
    );
  }

  Widget textHeading(String title) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(title,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: ColorKonstants.textgrey)),
    );
  }

  Widget demographicsSection(
      BuildContext context, GetSpecificPatientDataById? patientData) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textHeading("PATIENT DEMOGRAPHICS"),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                textStyle: MaterialStateProperty.all(
                    const TextStyle(decoration: TextDecoration.underline)),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PatientUpdateDetails(
                                  allergy: GetSpecificPatientAllergydata(
                                foodAllergies: [],
                                medicineAllergies: [],
                                patientId: sharedPrefs.patientId,
                                petAllergies: [],
                              ))));
                },
                child: const Text('Edit Details',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorKonstants.textcolor)),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              patientDemographicItem(CupertinoIcons.phone,
                  patientData?.userData.phoneNumber ?? ""),
              patientDemographicItem(CupertinoIcons.mail,
                  sharedPrefs.emailId ?? "eshaan@gmail.com"),
              patientDemographicItem(CupertinoIcons.location_solid,
                  patientData?.userData.address ?? ""),
            ],
          ),
        )
      ],
    );
  }

  Widget patientDemographicItem(IconData? icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(title,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
                height: 1.5,
              )),
        ),
      ],
    );
  }

  Widget expansionBox(IconData? icon, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon),
          Text(title,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: ColorKonstants.textcolor)),
        ],
      ),
    );
  }

  Widget clinicDetails(String clinicName, String jatyaClinicId, String type) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(ImagesConstants.clinicPlaceholder),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clinicName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        jatyaClinicId,
                        style: TextStyle(
                          fontSize: 14.8,
                          fontWeight: FontWeight.w400,
                          color: ColorKonstants.headingTextColor,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Center(
                        child: Text('\u2022',
                            style: TextStyle(fontSize: 24, color: Colors.grey)),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        type,
                        style: TextStyle(
                          fontSize: 14.8,
                          fontWeight: FontWeight.w400,
                          color: ColorKonstants.headingTextColor,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                patientDemographicItem(CupertinoIcons.phone, '+91 1234567890'),
                patientDemographicItem(CupertinoIcons.mail, 'alex@example.com'),
                patientDemographicItem(CupertinoIcons.location_solid,
                    '123, ABC Street, XYZ City - 123456'),
              ],
            ),
          ),
        ]);
  }

  Widget appHeaderDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Jatya App",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                customTextFieldgrey("Installed 3 days ago", fontSize: 16),
              ],
            ),
          ],
        ),
        Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(223, 177, 218, 255),
                border: Border.all(
                  color: ColorKonstants.primarySwatch,
                ),
                borderRadius: BorderRadius.circular(1.8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    CupertinoIcons.tag_fill,
                    color: ColorKonstants.verifiedBorder,
                    size: 12,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                const Padding(
                  padding: EdgeInsets.all(2.5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "FREE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: ColorKonstants.primarySwatch),
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }

  Widget appDeatils(BuildContext context) {
    return Column(children: [
      appHeaderDetails(),
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: customTextFieldBlack("Last Logged in"),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 7),
                    child: customTextFieldgrey("12/03/2023")),
                customTextFieldgrey("12:55 PM"),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: customTextFieldBlack("Password Last\nUpdated"),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: customTextFieldgrey("12/03/2023"),
                ),
                customTextFieldgrey("12:55 PM"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 18, left: 18, right: 18, bottom: 10),
              child: GestureDetector(
                onTap: () {
                  // BlocProvider.of<PatientBloc>(context).add(FetchPatientData());
                },
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorKonstants.primaryColor,
                  ),
                  child: const Center(
                      child: Text(
                    'Change Password',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  )),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customTextFieldgrey("Need Help?"),
                const SizedBox(
                  width: 2,
                ),
                customTextFieldBlack("Call us", isUnderline: true),
              ],
            )
          ],
        ),
      )
    ]);
  }

  Widget customTextFieldBlack(String value, {bool isUnderline = false}) {
    return Text(
      value,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        decoration:
            isUnderline ? TextDecoration.underline : TextDecoration.none,
        color: Colors.black,
        height: 1.5,
      ),
    );
  }

  Widget customTextFieldgrey(String value, {double fontSize = 14}) {
    return Text(
      value,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
        height: 1.5,
      ),
    );
  }
}
