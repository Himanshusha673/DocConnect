import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jatya_patient_mobile/modules/Reports/models/get_recent_report_response_model.dart';
import 'package:jatya_patient_mobile/modules/Reports/services/recent_reports_repo.dart';
import 'package:jatya_patient_mobile/utils/SharePref.dart';

part 'get_all_reports_event.dart';
part 'get_all_reports_state.dart';

class GetAllRecentReportsBloc
    extends Bloc<GetAllReportsEvent, GetAllReportsState> {
  GetAllRecentReportsBloc() : super(GetAllReportsInitial()) {
    on<GetAllReportsEvent>(_getAllRecentReports);
  }

  FutureOr<void> _getAllRecentReports(
      GetAllReportsEvent event, Emitter<GetAllReportsState> emit) async {
    log("fetcing all PrevReports  for specififc patient");
    emit(GetAllReportsLoading());
    GetAllRecentReportsResponse getAllPrevReportsForSpecificPatient =
        await RecentReportsRepository.fetchAllRecentreportsforSpecPatient(
            sharedPrefs.patientId, sharedPrefs.authToken);
    emit(GetAllReportsSuccess(response: getAllPrevReportsForSpecificPatient));
  }
}
