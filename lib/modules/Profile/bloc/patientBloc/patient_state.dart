import 'package:jatya_patient_mobile/modules/Profile/models/get_all_prev_reports/get_all_prev_repo.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/get_all_vaccination/get_all_vacc_spec_pat.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/allergies/get_allergies_model.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/get_speci_by_uid/get_spe_pat_uid_Data.dart';
import 'package:jatya_patient_mobile/modules/Profile/models/get_specific_patient_by_id/get_sprecific_patient_by_id.dart';

abstract class PatientState {}

class PatientInitialState extends PatientState {}

class PatientLoadingState extends PatientState {}

class PatientSuccessState extends PatientState {
  GetSpecificPatientresponse? data;
  AllergieModel allergy;
  GetSpecificPatientresponseByUid dataByUid;
  GetAllPrevReportsForSpecificPatient prevReports;
  GetAllvaccinationForSpecificPatient vaccinreports;
  PatientSuccessState(
    this.data,
    this.allergy,
    this.dataByUid,
    this.vaccinreports,
    this.prevReports,
  );
}

class AllergySuccessState extends PatientState {
  AllergieModel allergy;
  AllergySuccessState({required this.allergy});
}

class PatientFailureState extends PatientState {
  String errorMsg;
  PatientFailureState(this.errorMsg);
}
