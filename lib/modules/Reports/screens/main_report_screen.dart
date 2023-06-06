import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doc_connect/modules/Reports/bloc/get_recent_reports/get_all_reports_bloc.dart';
import 'package:doc_connect/modules/Reports/models/clinic_model.dart';
import 'package:doc_connect/modules/Reports/models/get_recent_report_response_model.dart';
import 'package:doc_connect/modules/Reports/screens/Orthocare_tab.dart';
import 'package:doc_connect/modules/Reports/screens/all_clinics_tab.dart';
import 'package:doc_connect/modules/Reports/screens/neurowell._tab.dart';

import '../../../common_components/widgets/common_tabbar.dart';

class MainReportsScreen extends StatelessWidget {
  const MainReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllRecentReportsBloc, GetAllReportsState>(
      builder: (context, state) {
        if (state is GetAllReportsInitial) {
          BlocProvider.of<GetAllRecentReportsBloc>(context)
              .add(GetAllRecentReportsEvent());
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAllReportsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetAllReportsSuccess) {
          return body(context, state.response);
        } else {
          return Center(child: body(context, null));
        }
      },
    );
  }

  Widget body(BuildContext context, GetAllRecentReportsResponse? response) {
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
        response?.data == null
            ? const Center(child: Text('No Reports Found'))
            : AllClinicTab(
                clinicList: response!.data!
                    .map((e) => AllClinicModel(
                          date: e.reportDate,
                          title: e.reportName,
                        ))
                    .toList(),
                // [
                //   AllClinicModel(
                //     date: 'JAN 01, 2023',
                //     title: 'Dentle Extraction',
                //   ),
                //   AllClinicModel(
                //     date: 'JAN 01, 2023',
                //     title: 'Dentle Extraction',
                //   ),
                //   AllClinicModel(
                //     date: 'JAN 01, 2023',
                //     title: 'Dentle Extraction',
                //   ),
                //   AllClinicModel(
                //     date: 'JAN 01, 2023',
                //     title: 'Dentle Extraction',
                //   ),
                //   AllClinicModel(
                //     date: 'JAN 01, 2023',
                //     title: 'Dentle Extraction',
                //   ),
                //   AllClinicModel(
                //     date: 'JAN 01, 2023',
                //     title: 'Dentle Extraction',
                //   ),
                // ],
              ),
        NeuroWellTab(
          clinicList1: [
            NeurowellModel(
              date: 'JAN 01, 2023',
              title: 'Dentle Extraction',
            ),
            NeurowellModel(
              date: 'JAN 01, 2023',
              title: 'Dentle Extraction',
            ),
            NeurowellModel(
              date: 'JAN 01, 2023',
              title: 'Dentle Extraction',
            ),
          ],
        ),
        OrthocareTab(
          clinicList2: [
            OrthocareModel(
              date: 'JAN 01, 2023',
              title: 'Dentle Extraction',
            ),
            OrthocareModel(
              date: 'JAN 01, 2023',
              title: 'Dentle Extraction',
            ),
            OrthocareModel(
              date: 'JAN 01, 2023',
              title: 'Dentle Extraction',
            ),
          ],
        ),
        const Text('Tab 4'),
        const Text('Tab 5'),
      ],
      screenTitle: 'My Reports',
      bottomBarItems: [
        TextButton.icon(
          icon: const Icon(
            Icons.sort,
            color: Colors.blue,
          ),
          label: const Text('SORT', style: TextStyle(color: Colors.blue)),
          onPressed: () {
            // Add your sort button functionality here
          },
        ),
        TextButton.icon(
          icon: const Icon(
            Icons.search,
            color: Colors.blue,
          ),
          label: const Text('SEARCH', style: TextStyle(color: Colors.blue)),
          onPressed: () {
            // Add your search button functionality here
          },
        ),
      ],
    );
  }
}
