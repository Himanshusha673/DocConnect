import 'package:flutter/material.dart';
import 'package:doc_connect/common_components/widgets/link_text.dart';

import '../../../common_components/widgets/label.dart';
import '../../../common_components/widgets/map_icon.dart';
import '../../../utils/constants/image_konstants.dart';
import '../../NewAppointment/screens/payment_screen.dart';

class MedilineCardDetailPopup extends StatefulWidget {
  const MedilineCardDetailPopup({super.key});

  @override
  State<MedilineCardDetailPopup> createState() =>
      _MedilineCardDetailPopupState();
}

class _MedilineCardDetailPopupState extends State<MedilineCardDetailPopup> {
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
              Stack(
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 12),
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
            color: Colors.white60, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: ProfileImage(
                      scale: 0.2, image: ImagesConstants.docPlaceholder),
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
                        "Dr Neetu Sharma",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Dermatologist",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Tue, Dec 6 | 6:30-7:30 AM",
                        style: TextStyle(
                          color: Colors.grey.shade700,
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
                  height: MediaQuery.of(context).size.width * 0.4,
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
            Container(
              child: Row(
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
                          const Text("In-Person Consultation"),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Flat C1029, Purva Skydale,Banglore"),
                      )
                    ],
                  ),
                  const MapIcon()
                ],
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              dense: true,
              leading: const Icon(Icons.watch),
              title: const Text(
                "Save your time at the clinic by syncing your data directly from your Smartwatch",
                style: TextStyle(fontSize: 11),
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
                    Text(
                      "Sync",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: const StadiumBorder(
                        side: BorderSide(width: 0.5, color: Colors.red),
                      ),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Cancel Appointment"),
                    ))),
            LinkText(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "Back to my mediline"),
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
