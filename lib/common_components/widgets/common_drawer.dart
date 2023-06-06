import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:jatya_patient_mobile/modules/Mediline/screens/my_mediline_screen.dart';
import 'package:jatya_patient_mobile/modules/MyPrescription/bloc/myPrescriptionBloc/my_prescription_bloc.dart';
import 'package:jatya_patient_mobile/modules/Reports/screens/main_report_screen.dart';
import 'package:jatya_patient_mobile/common_components/widgets/logout_alert.dart';
import 'package:jatya_patient_mobile/common_components/widgets/policy_dialog.dart';
import 'package:jatya_patient_mobile/modules/Faq/screens/faq_screen.dart';
import 'package:jatya_patient_mobile/modules/MyJatya/screens/MyJatya.dart';
import 'package:jatya_patient_mobile/modules/MyPrescription/screens/my_prescription_screen.dart';
import 'package:jatya_patient_mobile/modules/NewAppointment/screens/NewAppointment.dart';
import 'package:jatya_patient_mobile/modules/Notifications/screens/notification_screen.dart';
import 'package:jatya_patient_mobile/modules/Profile/screens/patient_profile_screen.dart';
import 'package:jatya_patient_mobile/modules/online_consultation/screens/new_online_consultation.dart';
import 'package:jatya_patient_mobile/utils/constants/image_konstants.dart';
import '../../SharedFiles/SharedFiles.dart';
import '../../modules/online_consultation/widgets/start_consultation_alert.dart';
import '../../utils/constants/terms_konstants.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          //  title: Stack(
          //   children: <Widget>[
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: const <Widget>[
          //         Icon(CupertinoIcons.text_justify),
          //         SizedBox(width: 0),
          //         Text('My App'),
          //       ],
          //     ),
          //   ],
          // ),
          // The above code can be used to add icon before jatya title.
          title: const Text('Jatya'),
          centerTitle: false,
          leading: IconButton(
            icon: Image.asset(ImagesConstants.jsymbol),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            children: [
              ListTile(
                title: const DrawerItem(
                    title: "My Jatya", image: ImagesConstants.myJatyaDrawer),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const MyJatya()));
                },
              ),
              ListTile(
                title: const DrawerItem(
                    title: "Mediline", image: ImagesConstants.medilineDrawer),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyMedilineScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const DrawerItem(
                    title: "Prescription",
                    image: ImagesConstants.prescriptionDrawer),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      BlocProvider.of<MyPrescriptionBloc>(context)
                          .add(GetAllMyPrescriptionEvent());
                      return const MyPrescriptionScreen();
                    }),
                  );
                },
              ),

              ListTile(
                title: const DrawerItem(
                    title: "Reports", image: ImagesConstants.reportDrawer),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainReportsScreen(),
                    ),
                  );
                  // Update the state of the app.
                  // ...
                },
              ),
              Divider(
                color: Colors.grey[350],
                thickness: 1,
                endIndent: 2.5,
                indent: 0.5,
              ),
              ListTile(
                title: const DrawerItem(
                  title: 'Book an Appointment',
                  image: ImagesConstants.appointmentDrawer,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewAppointmentScreen()));
                },
              ),
              ListTile(
                title: const DrawerItem(
                    title: "Consult Doctor Online",
                    image: ImagesConstants.videoCallDrawer),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const NewOnlineConsultationScreen()));
                  // ...
                },
              ),
              Divider(
                color: Colors.grey[350],
                thickness: 1,
                endIndent: 2.5,
                indent: 0.5,
              ),
              ListTile(
                title: const DrawerItem(
                    title: "Search", image: ImagesConstants.searchDrawer),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const DrawerItem(
                    title: "Shared files", image: ImagesConstants.shareDrawer),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SharedFiles()));
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const DrawerItem(
                    title: "Notifications",
                    image: ImagesConstants.notificationDrawer),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationScreen()));
                  // NotificationScreen
                },
              ),
              ListTile(
                title: const DrawerItem(
                    title: "FAQ", image: ImagesConstants.faqDrawer),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FAQScreen()));
                  // ...
                },
              ),
              Divider(
                color: Colors.grey[350],
                thickness: 1,
                endIndent: 2.5,
                indent: 0.5,
              ),
              ListTile(
                title: Row(
                  children: [
                    Image.asset(
                      ImagesConstants.profileimage,
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(width: 5),
                    const Text('My Profile'),
                  ],
                ),
                /*const DrawerItem(
                    title: "My Profile",
                    image: ImagesConstants.profileimage,),*/
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const PatientProfileScreen();
                  }));
                  // ...
                },
              ),
              ListTile(
                title: const DrawerItem(
                    title: "Logout", image: ImagesConstants.logoutDrawer),
                onTap: () {
                  Navigator.pop(context);
                  showPopup(context: context, child: const LogoutAletDialog());
                  // Update the state of the app.
                  // ...
                },
              ),
              Divider(
                color: Colors.grey[350],
                thickness: 1,
                endIndent: 2.5,
                indent: 0.5,
              ),
              //unline text "About the app" at the bottom of the drawer
              const SizedBox(
                height: 100,
              ),
              ListTile(
                title: const Text(
                  'About the app',
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return PolicyDialog(
                        isAboutApp: true,
                        titleText: 'Jatya app',
                        text: TermsConstants.aboutApp,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final String image;

  const DrawerItem({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          image,
        ),
        const SizedBox(width: 10),
        Text(title),
      ],
    );
  }
}
