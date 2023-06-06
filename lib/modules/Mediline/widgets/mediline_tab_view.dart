import 'package:flutter/material.dart';
import 'package:doc_connect/modules/Mediline/models/get_appointmens_response.dart';
import 'package:doc_connect/modules/Mediline/widgets/clinic_appointments_tabview.dart';

import '../../NewAppointment/model/get_clinic_detail_response.dart';

class MedilineTabView extends StatefulWidget {
  final List<AppointmentDetail> appointments;
  final List<Clinic> clinicList;
  const MedilineTabView({
    super.key,
    required this.appointments,
    required this.clinicList,
  });

  @override
  State<MedilineTabView> createState() => _MedilineTabViewState();
}

class _MedilineTabViewState extends State<MedilineTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(vsync: this, length: (widget.clinicList.length + 1));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ))),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TabBar(controller: _tabController, tabs: [
                    const Tab(
                      text: "All clinic",
                    ),
                    ...widget.clinicList
                        .map((e) => Tab(
                              text: e.name,
                            ))
                        .toList()
                  ])),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ClinicAppointmentsTabView(appointments: widget.appointments),
                ...widget.clinicList
                    .map((e) => ClinicAppointmentsTabView(
                        appointments: widget.appointments
                            .where((element) =>
                                element.appointment.clinicId == e.id)
                            .toList()))
                    .toList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
