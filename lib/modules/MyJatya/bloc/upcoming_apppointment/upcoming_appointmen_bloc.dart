import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jatya_patient_mobile/modules/MyJatya/models/cancel_appointment_model.dart';
import 'package:jatya_patient_mobile/modules/MyJatya/models/upcoming_appointment_model.dart';
import 'package:jatya_patient_mobile/modules/MyJatya/services/appoitment_services.dart';
import 'package:jatya_patient_mobile/utils/SharePref.dart';

part 'upcoming_appointmen_event.dart';
part 'upcoming_appointmen_state.dart';

class UpcomingAppointmenBloc
    extends Bloc<UpcomingAppointmenEvent, UpcomingAppointmenState> {
  UpcomingAppointmenBloc() : super(UpcomingAppointmenInitial()) {
    on<GetUpcomingApppointmentEvent>(_loadAppointments);

    on<CancelUpcomingAppointmentEvent>(_cancelUpcomingAppointment);
  }

  FutureOr<void> _loadAppointments(GetUpcomingApppointmentEvent event,
      Emitter<UpcomingAppointmenState> emit) async {
    GetAllAppointmentsResponse? getAllAppointments;
    emit(UpcomingAppointmenloading());
    try {
      getAllAppointments = await AppointmentRepo.fetchAllAppointments(
          sharedPrefs.patientId ?? " ",
          sharedPrefs.authToken!,
          // "PENDING",
          true);

      if (getAllAppointments != null) {
        log("setting appointId${getAllAppointments.data![0].appointment!.id!}");
        sharedPrefs
            .setAppointmentId(getAllAppointments.data![0].appointment!.id!);
            
        emit(UpcomingAppointmenSuccess(getAllAppointments: getAllAppointments));
      } else {
        emit(const UpcomingAppointmeFailure(
            err: "No Upcoming Appointments Found!"));
      }
    } catch (e) {
      log(e.toString());
      emit(UpcomingAppointmeFailure(err: e.toString()));
    }
  }

  FutureOr<void> _cancelUpcomingAppointment(
      CancelUpcomingAppointmentEvent event,
      Emitter<UpcomingAppointmenState> emit) async {
    CancelAppointmentResponse? cancelAppointmentResponse;
    try {
      cancelAppointmentResponse = await AppointmentRepo.cancelAppointment(
        event.appointmentId,
        sharedPrefs.authToken ?? "",
      );
    } catch (e) {
      log(e.toString());
    }
    if (cancelAppointmentResponse != null) {
      log("all done");
      emit(CancelAppointAndNavigatePop());
      sharedPrefs.setAppointmentId("");
    } else {
      emit(CancelAppointmentFailure());
    }
  }
}
