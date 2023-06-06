import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doc_connect/modules/Mediline/models/get_appointmens_response.dart';
import 'package:doc_connect/modules/Mediline/services/mediline_repository.dart';
import 'package:doc_connect/modules/NewAppointment/services/appointment_repository.dart';

import '../../NewAppointment/model/get_clinic_detail_response.dart';

part 'mediline_event.dart';
part 'mediline_state.dart';

class MedilineBloc extends Bloc<MedilineEvent, MedilineState> {
  MedilineBloc() : super(MedilineState()) {
    on<MedilineGetAllAppointmetns>((event, emit) async {
      emit(MedilineLoadingState());
      GetAppointmentResponse? res =
          await MedilineRepository().getappointementsofPatient();
      // GetAllClinicResopnse? clinicRes = await MedilineRepository().getclinics();
      List<String> clinicIds =
          res?.data.map((e) => e.appointment.clinicId).toSet().toList() ?? [];
      List<Clinic> clinicInAppointmnets = [];
      for (String id in clinicIds) {
        GetClinicDetailResponse? res =
            await AppointmentRepository().getClinicDetail(clinicId: id);
        res != null ? clinicInAppointmnets.add(res.data.clinic) : null;
      }

      log("clinics  $clinicIds");

      emit(state.copyWith(
          appointmentList: res?.data ?? [], clinicList: clinicInAppointmnets));
    });

    on<MedilineSelectedDateChangedEvent>((event, emit) {});
    on<MedilineGetAppointemtnListEvent>((event, emit) {});
    on<MedilineEmptyAppointmentListEvent>((event, emit) {});
    on<MedilineFailedGetAppointListEvent>((event, emit) {});
  }
}
