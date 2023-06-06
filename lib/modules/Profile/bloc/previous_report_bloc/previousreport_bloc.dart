import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/prev_reports/post_report_request.dart';
import 'package:jatya_patient_mobile/modules/Profile/services/previous_report_repository.dart';
import 'package:jatya_patient_mobile/utils/SharePref.dart';

import '../../../../common_components/widgets/dropdown.dart';
import '../../models/prev_reports/get_previous_reports_response.dart';

part 'previousreport_event.dart';
part 'previousreport_state.dart';

class PreviousReportBloc extends Bloc<PreviousReportEvent, PreviousReportState> {
  PreviousReportBloc() : super(const PreviousReportState()) {
    on<PreviousReportInitialEvent>((event, emit) async {
      final res = await PreviousReportRepository().getReports();
      if (res != null) {
        emit(state.copyWith(reports: res.data));
      }
    });
    on<PreviousReportNameChangedEvent>((event, emit) {
      emit(state.copyWith(reportName: event.reportName));
    });
    on<PreviousReportDateChangedEvent>((event, emit) {
      emit(state.copyWith(date: event.date));
    });
    on<PreviousReportGetReportsEvent>((event, emit) {});
    on<PreviousReportUploadReportEvent>((event, emit) async {
      //uplaoad report
      String? imageUrl = await PreviousReportRepository().uploadReportFile(file: event.file);
      if (imageUrl != null) {
        DateTime date = DateTime.parse(state.date!);
        final res = await PreviousReportRepository().postReport(
            postReportRequest: PostReportRequest(
          patientId: sharedPrefs.patientId ?? '',
          reportName: state.reportName?.name ?? "",
          reportDate: DateTime.parse(state.date!),
          url: imageUrl,
        ));
        if (res != null) {
          emit(PreviousReportUploadedState());
        }
      }
    });
    on<PreviousReportLoadingEvent>((event, emit) {});
  }
}
