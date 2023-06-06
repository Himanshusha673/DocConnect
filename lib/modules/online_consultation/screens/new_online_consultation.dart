import 'package:flutter/material.dart';
import 'package:jatya_patient_mobile/common_components/widgets/common_drawer.dart';
import 'package:jatya_patient_mobile/modules/online_consultation/screens/new_online_consultation_result.dart';
import 'package:jatya_patient_mobile/common_components/widgets/date_picker.dart';
import 'package:jatya_patient_mobile/common_components/widgets/dropdown.dart';

class NewOnlineConsultationScreen extends StatefulWidget {
  const NewOnlineConsultationScreen({super.key});

  @override
  State<NewOnlineConsultationScreen> createState() =>
      _NewOnlineConsultationScreenState();
}

class _NewOnlineConsultationScreenState
    extends State<NewOnlineConsultationScreen> {
  //form fields

  List<DropDownItem> specialityOptions = const [
    DropDownItem(name: 'Urologist', iconData: Icons.airline_seat_flat_rounded),
    DropDownItem(name: 'Dermatolist', iconData: Icons.monitor_heart),
    DropDownItem(name: 'Ent', iconData: Icons.hearing),
    DropDownItem(
      name: 'Nephrology',
      iconData: Icons.connect_without_contact,
    ),
  ];
  DropDownItem? speciality;
  late DateTime appointmentDate = DateTime.now();
  late bool isEmergency = false;

  List<DropDownItem> genderOptions = const [
    DropDownItem(name: 'Male'),
    DropDownItem(name: 'Female'),
  ];
  DropDownItem? gender;

  bool showResult = false;

  @override
  void initState() {
    speciality = specialityOptions[0];
    gender = genderOptions[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Online Consultation'),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                child: const Icon(
                  Icons.question_mark_rounded,
                  size: 16,
                ),
              ))
        ],
      ),
      drawer: const CommonDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DropDownWidget(
                title: 'SELECT SPECIALITY',
                hint: 'Select Speciality',
                isMandatory: true,
                selectedItem: speciality,
                options: specialityOptions,
                onChanged: (value) {
                  setState(() {
                    speciality = value;
                  });
                }),
            Row(
              children: [
                DatePicker(
                  title: 'APPOINTMENT DATE',
                  isMandatory: true,
                  onChanged: (value) {
                    appointmentDate = value;
                  },
                ),

                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width*0.38,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: isEmergency,
                          onChanged: (value) {
                            setState(() {
                              isEmergency = value ?? false;
                            });
                          }),
                      const Text('Emergency')
                    ],
                  ),
                )
              ],
            ),
            DropDownWidget(
                title: 'DOCTOR GENDER',
                hint: 'select Gender',
                selectedItem: gender,
                options: genderOptions,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                }),
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height*0.06,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showResult = !showResult;
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Show Available Doctors"),
              ),
            ),
            const SizedBox(height: 16),
            showResult ? const NewOnlineConsultationResult() : Container()
          ],
        ),
      ),
    );
  }
}
