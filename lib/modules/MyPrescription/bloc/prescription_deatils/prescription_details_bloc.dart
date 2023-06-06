import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:doc_connect/modules/MyPrescription/models/prescription_deatils/prescription_details.dart';
import 'package:equatable/equatable.dart';
import 'package:doc_connect/modules/MyPrescription/models/download_prescription/download_prescription_details.dart';
import 'package:doc_connect/modules/MyPrescription/models/prescription_deatils/prescription_details.dart';
import 'package:doc_connect/modules/MyPrescription/services/prescription_services.dart';
import 'package:doc_connect/utils/SharePref.dart';

part 'prescription_details_bloc_event.dart';
part 'prescription_details_bloc_state.dart';

class PrescriptionDetailsBlocBloc
    extends Bloc<PrescriptionDetailsBlocEvent, PrescriptionDetailsBlocState> {
  PrescriptionDetailsBlocBloc() : super(PrescriptionDetailsBlocInitial()) {
    on<GetPrescriptionDetailsEvent>((event, emit) async {
      emit(PrescriptionDetailsBlocLoading());
      PrescriptionDetails? prescriptionDetails;

      try {
        prescriptionDetails = await PrescriptionRepo
            .fetchSpecificPrescriptionsDetailsByAppointmentID(
                event.appointmentID, sharedPrefs.authToken!);
      } catch (e) {
        log(e.toString());
      }
      if (prescriptionDetails != null) {
        emit(PrescriptionDetailsBlocSuccess(prescriptionDetails));
      } else {
        emit(PrescriptionDetailsBlocFailure());
      }
    });
    on<DownloadPrescriptionDetailsEvent>((event, emit) async {
      emit(PrescriptionDownloadBlocLoading());
      DownloadPrescriptionDetails? prescriptionDetails;

      try {
        prescriptionDetails = await PrescriptionRepo.downloadPrescriptionPdf(
            event.prescriptionId, sharedPrefs.authToken!);
      } catch (e) {
        log(e.toString());
      }
      if (prescriptionDetails != null) {
        emit(PrescriptionDownloadBlocSuccess(
          prescriptionPdfurl: prescriptionDetails.data!,
        ));
      } else {
        emit(PrescriptionDownlaodBlocFailure());
      }
    });
  }
}
