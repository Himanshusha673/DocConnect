import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_components/widgets/common_image_holder.dart';
import '../../../../common_components/widgets/common_upload_box.dart';
import '../../../../common_components/widgets/date_picker.dart';
import '../../../../common_components/widgets/dropdown.dart';
import '../../../../common_components/widgets/error_alert_dialog.dart';
import '../../../../common_components/widgets/popup_widget.dart';
import '../../bloc/previous_report_bloc/previousreport_bloc.dart';
import '../../models/prev_reports/get_previous_reports_response.dart';

class PreviousReportForm extends StatefulWidget {
  final ReportDatum? report;
  const PreviousReportForm({super.key, this.report});

  @override
  State<PreviousReportForm> createState() => _PreviousReportFormState();
}

class _PreviousReportFormState extends State<PreviousReportForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<PreviousReportBloc, PreviousReportState>(
          builder: (context, state) {
            return DropDownWidget(
              title: "REPORT TYPE",
              options: state.reportOptions,
              selectedItem: widget.report != null ? DropDownItem(name: widget.report!.reportName) : state.reportName,
              onChanged: (value) => context.read<PreviousReportBloc>().add(PreviousReportNameChangedEvent(reportName: value)),
            );
          },
        ),
        const SizedBox(
          height: 5,
        ),
        BlocBuilder<PreviousReportBloc, PreviousReportState>(
          builder: (context, state) {
            return DatePicker(
                title: "VACCINATION DATE",
                width: MediaQuery.of(context).size.width,
                initialDate: widget.report != null ? widget.report!.reportDate.toString() : state.date,
                onChanged: (value) => context.read<PreviousReportBloc>().add(PreviousReportDateChangedEvent(date: value.toString())));
          },
        ),
        BlocBuilder<PreviousReportBloc, PreviousReportState>(builder: (context, state) {
          return GestureDetector(
              onTap: () async {
                if (widget.report != null) {
                  return;
                }
                if (state.reportName == null) {
                  showPopup(context: context, child: const ErrorAlertDialog(error: "Select Report type"));
                  return;
                }
                if (state.date == null) {
                  showPopup(context: context, child: const ErrorAlertDialog(error: "Select Date"));
                  return;
                }
                FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'pdf', 'doc'],
                ).then((value) {
                  if (value != null) {
                    log("image  ${value.files.single.path}");
                    context.read<PreviousReportBloc>().add(PreviousReportUploadReportEvent(file: File(value.files.single.path ?? '')));
                  }
                });
              },
              child: widget.report != null
                  ? ReportHolder(
                      value: widget.report!.reportName,
                      url: widget.report!.url,
                    )
                  : CommonUploadReport(
                      isDisabled: state.reportName == null || state.date == null,
                    ));
        }),
      ],
    );
  }
}
