import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jatya_patient_mobile/modules/Profile/bloc/update_patient_prof_bloc/upadte_pat_state.dart';
import 'package:jatya_patient_mobile/modules/Profile/bloc/update_patient_prof_bloc/update_pat_event.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/update_patient_model/update_pati_prof.dart';
import 'package:jatya_patient_mobile/modules/Profile/services/patient_services.dart';
import 'package:jatya_patient_mobile/utils/SharePref.dart';

class UpdatePatientProfileBloc
    extends Bloc<PatientUpdateEvent, UpdatePatientState> {
  UpdatePatientProfileBloc()
      : super(FormInitialState(
            form: PatientUpdateFormModel(
          gender: '',
          maritalStatus: '',
          height: "",
          weight: "",
          userId: '',
          createdAt: "2023 11:32:10",
          updatedAt: "2023 11:32:10",
          isArchived: false,
        ))) {
    on<PatientUpdateFormSubmitted>((event, emit) async {
      emit(FormLoadingState());
      try {
        final updatedForm = await PatientRepository.updateUserDemographic(
            event.form, sharedPrefs.id!, sharedPrefs.authToken!);
        final updateAllergy = await PatientRepository.updateAllergies(
            event.allergyUpdateRequest,
            event.allergyId,
            sharedPrefs.authToken!);
        emit(FormSuccessState(form: updatedForm));
      } catch (error) {
        emit(FormSubmissionFailure(error.toString()));
      }
    });
  }
}
