import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jatya_patient_mobile/common_components/widgets/common_tabbar.dart';
import 'package:jatya_patient_mobile/modules/MyPrescription/bloc/myPrescriptionBloc/my_prescription_bloc.dart';
import 'package:jatya_patient_mobile/modules/MyPrescription/models/latest_prescription.dart';
import 'package:jatya_patient_mobile/modules/MyPrescription/screens/all_clinics_tab.dart';

class MyPrescriptionScreen extends StatelessWidget {
  const MyPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyPrescriptionBloc, MyPrescriptionState>(
      builder: (context, state) {
        if (state is MyPrescriptionBlocloading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MyPrescriptionBlocSuccess) {
          return body(context, state.getAllPrescriptions);
        } else if (state is MyPrescriptionBlocFailure) {
          return body(context, null);
        } else {
          return const Center(child: Text("Something went wrong"));
        }
      },
    );
  }

  Widget body(BuildContext context,
      GetAllPrecriptionResposnse? getAllPrecriptionResposnse) {
    return CommonTabBar(
      tabItems: const [
        Tab(
          text: 'All Clinics',
        ),
        Tab(
          text: 'Neurowell',
        ),
        Tab(
          text: 'Orthocare Clinic',
        ),
        Tab(
          text: 'Dr. Smilez Dental',
        ),
        Tab(
          text: 'HomeCare KPHB',
        ),
      ],
      tabViewItems: [
        AllClinicTab(
          prescriptionList: getAllPrecriptionResposnse?.data ?? [],
        ),
        const Text('Tab 2'),
        const Text('Tab 3'),
        const Text('Tab 4'),
        const Text('Tab 5'),
      ],
      screenTitle: 'My Prescriptions',
      bottomBarItems: [
        TextButton.icon(
          icon: const Icon(Icons.sort),
          label: const Text('SORT', style: TextStyle(color: Colors.blue)),
          onPressed: () {
            // Add your sort button functionality here
          },
        ),
        TextButton.icon(
          icon: const Icon(Icons.search),
          label: const Text('SEARCH', style: TextStyle(color: Colors.blue)),
          onPressed: () {
            // Add your search button functionality here
          },
        ),
      ],
    );
  }
}
