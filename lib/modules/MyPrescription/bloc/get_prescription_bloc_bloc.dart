import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:doc_connect/modules/MyPrescription/models/latest_prescription.dart';
import 'package:doc_connect/modules/MyPrescription/services/prescription_services.dart';
import 'package:doc_connect/utils/SharePref.dart';

part 'get_prescription_bloc_event.dart';
part 'get_prescription_bloc_state.dart';

class GetPrescriptionBlocBloc
    extends Bloc<GetPrescriptionBlocEvent, GetPrescriptionBlocState> {
  GetPrescriptionBlocBloc() : super(GetPrescriptionBlocInitial()) {
    on<GetAllPrescriptionEvent>((event, emit) async {
      GetAllPrecriptionResposnse? getAllPrescriptions;
      emit(GetPrescriptionBlocloading());
      try {
        log("in bloc");
        getAllPrescriptions = await PrescriptionRepo.fetchAllPrescriptions(
          sharedPrefs.patientId ?? "",
          sharedPrefs.authToken ?? "",
        );
      } catch (e) {
        log(e.toString());
      }
      if (getAllPrescriptions != null) {
        emit(GetPrescriptionBlocSuccess(
            getAllPrescriptions: getAllPrescriptions));
      } else {
        emit(GetPrescriptionBlocFailure());
      }
    });
  }
}
