// ignore_for_file: prefer_const_constructors, unused_import, implementation_imports, unnecessary_import, prefer_const_literals_to_create_immutables, file_names, unused_local_variable, duplicate_ignore, sort_child_properties_last
// REMARKS:- NEED TO ADD ICONS IN THIS FILE WHICH ARE MISSING INSIDE ASSETS.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:doc_connect/modules/MyPrescription/models/prescription_deatils/prescription_details.dart';

import '../../../common_components/widgets/common_drawer.dart';
import '../../../utils/constants/color_konstants.dart';
import '../../../utils/constants/image_konstants.dart';

class DoctorsProfile extends StatelessWidget {
  final DoctorDetails doctorDetails;
  const DoctorsProfile({super.key, required this.doctorDetails});

  @override
  Widget build(BuildContext context) {
    var devicesize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CommonDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(devicesize.width * 0.03),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            radius: 25, // set the radius of the circle
                            backgroundImage: (doctorDetails.userData?.photo ==
                                    null)
                                ? NetworkImage(
                                    "https://diyaahospital.com/wp-content/uploads/2021/03/Dr-Sanjeev-A-Patil-300x300.jpg")
                                : NetworkImage(doctorDetails.userData!.photo!)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    doctorDetails.userData?.name ??
                                        "Dr. Neetu Sharma",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: devicesize.width * 0.15),
                                  child: Container(
                                    width: 85,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color:
                                            Color.fromARGB(255, 238, 228, 231)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: Colors.blue,
                                          size: 18,
                                        ),
                                        Text(
                                          "VERIFIED",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 12.5,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(
                                    doctorDetails.doctor?.specialisation ??
                                        "MBBS, MD in Dermat.",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: devicesize.width * 0.20),
                                  child: Container(
                                    width: 80,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.black,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "DOCTOR",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 39,
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Container(
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,

                padding: EdgeInsets.only(left: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 15),
                      child: textHeading("PERSONAL INFORMATION"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          infoItems(
                              CupertinoIcons.phone,
                              doctorDetails.userData?.phoneNumber ??
                                  '+91 1234567890'),
                          const SizedBox(
                            height: 8,
                          ),
                          infoItems(
                              CupertinoIcons.mail,
                              doctorDetails.userData?.email ??
                                  'alex@example.com'),
                          const SizedBox(
                            height: 10,
                          ),
                          infoItems(
                              CupertinoIcons.location_solid,
                              doctorDetails.userData?.address ??
                                  '123, ABC Street, XYZ City - 123456'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Column(
                          children: [consultingHours()],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 45,
              ),
              SizedBox(
                width: 250,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Consult Doctor Online"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorKonstants.primarySwatch),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Send Message",
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget textHeading(String title) {
  return Align(
    alignment: Alignment.topLeft,
    child: Text(title,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey)),
  );
}

Widget customTextFieldBlack(String val, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Text(
      val,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color,
        height: 1.5,
      ),
    ),
  );
}

Widget clinicDetails(String clinicName, String jatyaClinicId, String type) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 25,
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
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ColorKonstants.headingTextColor,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: Text('\u2022',
                          style: TextStyle(fontSize: 26, color: Colors.grey)),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      type,
                      style: TextStyle(
                        fontSize: 16,
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
          padding: const EdgeInsets.only(left: 55, top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              infoItems(CupertinoIcons.phone, '+91 1234567890'),
              const SizedBox(
                height: 8,
              ),
              infoItems(CupertinoIcons.mail, 'alex@example.com'),
              const SizedBox(
                height: 10,
              ),
              infoItems(CupertinoIcons.location_solid,
                  '123, ABC Street, XYZ City - 123456'),
            ],
          ),
        ),
      ]);
}

Widget infoItems(IconData? icon, String title) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.black54,
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Text(title,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: ColorKonstants.headingTextColor,
              height: 1.5,
            )),
      ),
    ],
  );
}

Widget consultingHours() {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 10, right: 80),
            child: textHeading("CONSULTING HOURS")),
        Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 8, left: 1, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customTextFieldBlack(
                      "Sunday", ColorKonstants.subHeadingTextColor),
                  customTextFieldBlack(
                      " Monday", ColorKonstants.subHeadingTextColor),
                  customTextFieldBlack(
                      "  Tuesday", ColorKonstants.subHeadingTextColor),
                  customTextFieldBlack(
                      "        Wednesday", ColorKonstants.subHeadingTextColor),
                  customTextFieldBlack(
                      "    Thursday", ColorKonstants.subHeadingTextColor),
                  customTextFieldBlack(
                      "Friday", ColorKonstants.subHeadingTextColor),
                  customTextFieldBlack(
                      "    Saturday", ColorKonstants.subHeadingTextColor),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customTextFieldBlack("  08:00 AM - 09:00 PM", Colors.grey),
                  customTextFieldBlack("  08:00 AM - 09:00 PM", Colors.grey),
                  customTextFieldBlack("  08:00 AM - 09:00 PM", Colors.grey),
                  customTextFieldBlack("  08:00 AM - 09:00 PM", Colors.grey),
                  customTextFieldBlack("  08:00 AM - 09:00 PM", Colors.grey),
                  customTextFieldBlack("  08:00 AM - 09:00 PM", Colors.grey),
                  customTextFieldBlack("  08:00 AM - 09:00 PM", Colors.grey),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
