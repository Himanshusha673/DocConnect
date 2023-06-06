import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jatya_patient_mobile/common_components/services/api_requests.dart';
import 'package:jatya_patient_mobile/common_components/widgets/dropdown.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/vaccination/get_vaccine_response.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/vaccination/post_vaccine_request.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/vaccination/post_vaccine_response.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/vaccination/vaccine.dart';
import 'package:jatya_patient_mobile/modules/Profile/services/vaccine_repository.dart';
import 'package:jatya_patient_mobile/utils/SharePref.dart';

part 'vaccinations_event.dart';
part 'vaccinations_state.dart';

class VaccinationsBloc extends Bloc<VaccinationsEvent, VaccinationsState> {
  VaccinationsBloc() : super(VaccinationsState()) {
    on<VaccinationReInitializeEvent>((event, emit) {
      emit(VaccinationsState());
    });
    on<VaccinationsGetVaccineListEvent>((event, emit) async {
      VaccinationsResponse? res = await VaccineRepository().getVaccines();
      if (res != null) {
        List<Vaccine> vacines = res.data
            .map((e) => Vaccine(
                  date: e.vaccinationDate.toString(),
                  imageurl: e.url,
                  image: File(""),
                  vaccineName: e.vaccinationName,
                ))
            .toList();
        emit(state.copyWith(vaccineList: vacines, vaccineName: null, date: null, image: null));
      }
      // emit(state.copyWith(vaccineName: event.vaccineName));
    });
    on<VaccinationsNameChangedEvent>((event, emit) {
      emit(state.copyWith(vaccineName: event.vaccineName));
    });
    on<VaccinationsDateChangedEvent>((event, emit) {
      emit(state.copyWith(date: event.date));
    });
    on<VaccinationsImageChangedEvent>((event, emit) {
      emit(state.copyWith(image: event.image));
    });
    on<VaccinationsAddVaccinationDetailEvent>((event, emit) async {
      if (state.image != null) {
        String? imageUrl = await VaccineRepository().uploadReportFile(file: state.image!);
        if (imageUrl != null) {
          DateTime date = DateTime.parse(state.date!);
          DateTime vacDate = DateTime.utc(date.year, date.month, date.day, 20, 18, 04);

          Response<PostVaccineResponse>? res = await VaccineRepository().postVaccine(
              postVaccineRequest: PostVaccineRequest(
            patientId: sharedPrefs.patientId ?? '',
            clinicId: sharedPrefs.patientClinicId ?? '',
            vaccinationName: state.vaccineName?.name ?? '',
            vaccinationDate: vacDate,
            url: imageUrl,
          ));
          if (res != null) {
            emit(VaccinationCreated());
          }
        }
      }
    });
  }
}
