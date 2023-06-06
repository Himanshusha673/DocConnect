import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doc_connect/modules/MyPrescription/models/prescription_deatils/prescription_details.dart';
import 'package:doc_connect/modules/MyPrescription/screens/doctors_profile.dart';
import 'package:doc_connect/utils/constants/color_konstants.dart';
import 'package:doc_connect/utils/constants/image_konstants.dart';
import '../../../common_components/widgets/common_drawer.dart';

class AbouttheClinicScreen extends StatelessWidget {
  final ClinicDetails? clinicInformation;
  const AbouttheClinicScreen({super.key, required this.clinicInformation});

  @override
  Widget build(BuildContext context) {
    var devicesize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CommonDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  clinicDetails(
                      clinicInformation?.name ?? "A1 Dental Clinic",
                      clinicInformation?.subscriptionId.toString() ?? "JTY003",
                      clinicInformation?.speciality?.first ?? "ORTHODONTICS …"),
                  const Divider(
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 25, // set the radius of the circle
                        backgroundImage:
                            AssetImage(ImagesConstants.ladyDocImage),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 17),
                                child: Text(
                                  clinicInformation?.socialMediaHandle ??
                                      "Shilpa Sanam",
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "BDS, MDS (Public Health...",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: devicesize.width * 0.04),
                                child: Container(
                                  width: 120,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: ColorKonstants.clinicOnwerTag,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "CLINIC OWNER",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
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
                  const SizedBox(
                    height: 17,
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Column(
                      children: [consultingHours()],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorKonstants.primarySwatch),
                  child: const Text("Call Clinic"),
                )),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Send Email",
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ))
          ],
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
                radius: 27,
                backgroundImage: AssetImage(ImagesConstants.clinicPlaceholder),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clinicName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
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
            padding: const EdgeInsets.only(left: 55, top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                infoItems(
                    CupertinoIcons.phone,
                    clinicInformation?.mobileNumbers?.first ??
                        '+91 1234567890'),
                const SizedBox(
                  height: 8,
                ),
                infoItems(CupertinoIcons.mail,
                    clinicInformation?.emailId ?? 'alex@example.com'),
                const SizedBox(
                  height: 10,
                ),
                infoItems(
                    CupertinoIcons.location_solid,
                    clinicInformation?.address ??
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
              padding: const EdgeInsets.only(left: 60, right: 80),
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
                    customTextFieldBlack("        Wednesday",
                        ColorKonstants.subHeadingTextColor),
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
}
