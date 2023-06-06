import 'package:flutter/material.dart';
import 'package:doc_connect/common_components/widgets/label.dart';
import 'package:doc_connect/common_components/widgets/map_icon.dart';
import 'package:doc_connect/modules/NewAppointment/screens/payment_screen.dart';
import 'package:doc_connect/utils/constants/color_konstants.dart';

import '../../../utils/constants/image_konstants.dart';

class ConfirmedAppointment extends StatefulWidget {
  const ConfirmedAppointment({super.key});

  @override
  State<ConfirmedAppointment> createState() => _ConfirmedAppointmentState();
}

class _ConfirmedAppointmentState extends State<ConfirmedAppointment> {
  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                  width: double.infinity,
                  // height: MediaQuery.of(context).size.height * 0.3,
                  // decoration: const BoxDecoration(
                  //     image: DecorationImage(
                  //         scale: 3,
                  //         fit: BoxFit.fill,
                  //         image: NetworkImage(
                  //             "https://www.seekpng.com/png/detail/15-150776_sprinkles-border-png-transparent-background-sprinkles-png.png"))),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Your Appointment is\n ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorKonstants.headingTextColor),
                      ),
                      TextSpan(
                          text: "Confirmed",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: ColorKonstants.headingTextColor))
                    ]),
                  )),
              Stack(
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 48),
                      child: appointmentDetail()),
                ],
              ),
              clinicDetail(),
            ],
          ),
        ),
      ),
    );
  }

  Widget appointmentDetail() {
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
                      const Text(
                        "Dr. Aditi Sharma",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Urologist",
                        style: TextStyle(
                          color: ColorKonstants.headingTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Tue, Dec 6 | 6:30-7:30 AM",
                        style: TextStyle(
                          color: ColorKonstants.headingTextColor,
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

  Widget clinicDetail() {
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
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.2,
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
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //          PatientUpdateDetails()
                      //          ));
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Update My Profile",
                        //style: TextStyle(color: Colors.red),
                      ),
                    ))),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Not now",
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
