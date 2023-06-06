import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jatya_patient_mobile/modules/MyPrescription/models/latest_prescription.dart';
import 'package:jatya_patient_mobile/modules/MyPrescription/services/prescription_services.dart';
import 'package:jatya_patient_mobile/utils/SharePref.dart';

part 'my_prescription_event.dart';
part 'my_prescription_state.dart';

class MyPrescriptionBloc
    extends Bloc<MyPrescriptionEvent, MyPrescriptionState> {
  MyPrescriptionBloc() : super(MyPrescriptionInitial()) {
    on<GetAllMyPrescriptionEvent>((event, emit) async {
      GetAllPrecriptionResposnse? getAllPrescriptions;
      emit(MyPrescriptionBlocloading());
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
        emit(MyPrescriptionBlocSuccess(
            getAllPrescriptions: getAllPrescriptions));
      } else {
        emit(MyPrescriptionBlocFailure());
      }
    });
  }
}
