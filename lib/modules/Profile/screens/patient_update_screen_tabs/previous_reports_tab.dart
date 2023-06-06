import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jatya_patient_mobile/common_components/widgets/success_alert_dialog.dart';
import 'package:jatya_patient_mobile/modules/Profile/bloc/previous_report_bloc/previousreport_bloc.dart';
import 'package:jatya_patient_mobile/modules/online_consultation/widgets/start_consultation_alert.dart';

import '../../models/get_all_prev_reports/get_all_prev_repo.dart';
import '../../widgets/previousReport/previous_report_form.dart';

class PreviousReportTab extends StatefulWidget {
  final GetAllPrevReportsForSpecificPatient? reports;
  const PreviousReportTab({super.key, this.reports});

  @override
  State<PreviousReportTab> createState() => _PreviousReportTabState();
}

class _PreviousReportTabState extends State<PreviousReportTab> {
  String vaccineVal1 = 'Blood Test';
  String vaccineVal2 = 'Body Test';

  bool issDateSelected = false;
  final DateTime _date = DateTime.now();
  String vaccinDate1 = "dd/mm/yyyy";
  String vaccinDate2 = "dd/mm/yyyy";

  Future _selectDate(BuildContext context, String vaccinationDatevalue) async {
    DateTime? datePicker = await showDatePicker(context: context, initialDate: _date, firstDate: DateTime(1947), lastDate: DateTime(2050));

    if (datePicker != null && datePicker != _date) {
      String selectedDate = datePicker.toString();
      selectedDate = selectedDate.replaceRange(10, 23, "");
      setState(() {
        if (vaccinationDatevalue == vaccinDate1) {
          vaccinDate1 = selectedDate;
        } else {
          vaccinDate2 = selectedDate;
        }

        issDateSelected = true;
      });
    }
  }

  @override
  void initState() {
    context.read<PreviousReportBloc>().add(const PreviousReportInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: BlocListener<PreviousReportBloc, PreviousReportState>(
        listener: (context, state) {
          if (state is PreviousReportUploadedState) {
            showPopup(context: context, child: const SuccessAlertDialog(message: "Report Uploaded"));
            context.read<PreviousReportBloc>().add(const PreviousReportInitialEvent());
          }
        },
        child: BlocBuilder<PreviousReportBloc, PreviousReportState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.reports.length,
                    itemBuilder: (context, index) {
                      return PreviousReportForm(
                        report: state.reports[index],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PreviousReportForm()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
