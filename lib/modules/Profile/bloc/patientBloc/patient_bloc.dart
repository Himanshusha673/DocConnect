import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jatya_patient_mobile/modules/Profile/bloc/patientBloc/patient_event.dart';
import 'package:jatya_patient_mobile/modules/Profile/bloc/patientBloc/patient_state.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/get_all_prev_reports/get_all_prev_repo.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/get_all_vaccination/get_all_vacc_spec_pat.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/allergies/get_allergies_model.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/get_speci_by_uid/get_spe_pat_uid_Data.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/get_specific_patient_by_id/get_sprecific_patient_by_id.dart';
import 'package:jatya_patient_mobile/modules/Profile/services/patient_services.dart';
import 'package:jatya_patient_mobile/utils/SharePref.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  @override
  PatientBloc() : super(PatientInitialState()) {
    on<FetchPatientData>((event, emit) async {
      emit(PatientLoadingState());
      try {
        log(sharedPrefs.authToken.toString());
        log(sharedPrefs.patientId.toString());
        log(sharedPrefs.id.toString());

        log("fetcing Specific PatientData by id");
        GetSpecificPatientresponse? patientData =
            await PatientRepository.fetchPatientData(
                sharedPrefs.patientId, sharedPrefs.authToken);
        // if (kDebugMode) {
        //   print(patientData!.data!.allergies![0].foodAllergies![0]);
        // }

        log(" in allergy");
        AllergieModel allergyData = await PatientRepository.fetchAllergies(
            sharedPrefs.id, sharedPrefs.authToken);

        log("fetcing Specific patientData by uid");
        GetSpecificPatientresponseByUid? patientDataByUid =
            await PatientRepository.fetchPatientDataByUid(
                sharedPrefs.id, sharedPrefs.authToken);

        log("fetcing all vaccination  for specififc patient");
        GetAllvaccinationForSpecificPatient
            getAllvaccinationForSpecificPatient =
            await PatientRepository.fetchAllVaccinationforSpecPatient(
                sharedPrefs.patientId!, sharedPrefs.authToken);

        log("fetcing all PrevReports  for specififc patient");
        GetAllPrevReportsForSpecificPatient
            getAllPrevReportsForSpecificPatient =
            await PatientRepository.fetchAllPrevreportsforSpecPatient(
                sharedPrefs.patientId, sharedPrefs.authToken);
        emit(PatientSuccessState(
            patientData,
            allergyData,
            patientDataByUid!,
            getAllvaccinationForSpecificPatient,
            getAllPrevReportsForSpecificPatient));
      } catch (e) {
        emit(PatientFailureState(e.toString()));
      }
    });

    on<FetchPatientAllergies>((event, emit) async {
      emit(PatientLoadingState());
      try {
        AllergieModel allergyData = await PatientRepository.fetchAllergies(
            sharedPrefs.id, sharedPrefs.authToken);

        // allergyData.data![0].medicineAllergies!.map((e) => print(e)).toList();

        emit(AllergySuccessState(
          allergy: allergyData,
        ));
      } catch (e) {
        emit(PatientFailureState(e.toString()));
      }
    });
  }
}
// import 'dart:developer';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jatya_patient_mobile/modules/Profile/bloc/patientBloc/patient_event.dart';
// import 'package:jatya_patient_mobile/modules/Profile/bloc/patientBloc/patient_state.dart';
// import 'package:jatya_patient_mobile/modules/Profile/models/get_all_prev_reports/get_all_prev_repo.dart';
// import 'package:jatya_patient_mobile/modules/Profile/models/get_all_vaccination/get_all_vacc_spec_pat.dart';
// import 'package:jatya_patient_mobile/modules/Profile/models/get_allergies/get_allergies_model.dart';
// import 'package:jatya_patient_mobile/modules/Profile/models/get_speci_by_uid/get_spec_pat_uid_model.dart';
// import 'package:jatya_patient_mobile/modules/Profile/models/get_specific_patient_by_id/get-specific_data.dart';
// import 'package:jatya_patient_mobile/modules/Profile/services/patient_services.dart';
// import 'package:jatya_patient_mobile/utils/SharePref.dart';

// class PatientBloc extends Bloc<PatientEvent, PatientState> {
//   @override
//   PatientBloc() : super(PatientInitialState()) {
//     on<FetchPatientData>((event, emit) async {
//       emit(PatientLoadingState());
//       log(sharedPrefs.authToken.toString());
//       log(sharedPrefs.patientId.toString());
//       GetSpecificPatientData? patientData;
//       try {
//         ////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////
//         log("fetcing Specific PatientData by id");
//         patientData = await PatientRepository.fetchPatientData(
//             sharedPrefs.id, sharedPrefs.authToken);
//         if (kDebugMode) {
//           print(patientData.allergies![0].foodAllergies![0]);
//         }
//       } catch (e) {
//         log(e.toString());
//         emit(PatientFailureState(e.toString()));
//       }
//       ////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////
//       log(" in allergy");
//       AllergieModel? allergyData;
//       try {
//         allergyData = await PatientRepository.fetchAllergies(
//             sharedPrefs.id, sharedPrefs.authToken);
//       } catch (e) {
//         log(e.toString());
//         emit(PatientFailureState(e.toString()));
//       }

// ////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////
//       log("fetcing Specific patientData by uid");
//       GetSpecificPatientModelByUid? patientDataByUid;
//       try {
//         patientDataByUid = await PatientRepository.fetchPatientDataByUid(
//             sharedPrefs.id, sharedPrefs.authToken);
//       } catch (e) {
//         log(e.toString());
//         emit(PatientFailureState(e.toString()));
//       }

//       ////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////
//       log("fetcing all vaccination  for specififc patient");
//       GetAllvaccinationForSpecificPatient? getAllvaccinationForSpecificPatient;
//       try {
//         getAllvaccinationForSpecificPatient =
//             await PatientRepository.fetchAllVaccinationforSpecPatient(
//                 sharedPrefs.patientId, sharedPrefs.authToken);
//       } catch (e) {
//         log(e.toString());
//         emit(PatientFailureState(e.toString()));
//       }

// ////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////////////////////////////////////////////////////////////////////
//       log("fetcing all PrevReports  for specififc patient");
//       GetAllPrevReportsForSpecificPatient? getAllPrevReportsForSpecificPatient;
//       try {
//         getAllPrevReportsForSpecificPatient =
//             await PatientRepository.fetchAllPrevreportsforSpecPatient(
//                 sharedPrefs.patientId, sharedPrefs.authToken);
//       } catch (e) {
//         log(e.toString());
//         emit(PatientFailureState(e.toString()));
//       }

//       emit(PatientSuccessState(
//           patientData!,
//           allergyData!,
//           patientDataByUid!,
//           getAllvaccinationForSpecificPatient!,
//           getAllPrevReportsForSpecificPatient!));
//     });

//     on<FetchPatientAllergies>((event, emit) async {
//       emit(PatientLoadingState());
//       try {
//         AllergieModel allergyData = await PatientRepository.fetchAllergies(
//             sharedPrefs.id, sharedPrefs.authToken);

//         // allergyData.data![0].medicineAllergies!.map((e) => print(e)).toList();

//         emit(AllergySuccessState(
//           allergy: allergyData,
//         ));
//       } catch (e) {
//         log(e.toString());
//         emit(PatientFailureState(e.toString()));
//       }
//     });
//   }
// }

