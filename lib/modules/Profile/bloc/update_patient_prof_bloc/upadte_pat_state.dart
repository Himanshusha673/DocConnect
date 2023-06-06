import 'package:jatya_patient_mobile/modules/Profile/models/update_patient_model/update_pati_prof.dart';

abstract class UpdatePatientState {}

class FormInitialState extends UpdatePatientState {
  PatientUpdateFormModel form;
  FormInitialState({required this.form});
}

class FormLoadingState extends UpdatePatientState {}

class FormSuccessState extends UpdatePatientState {
  PatientUpdateFormModel form;
  FormSuccessState({required this.form});
}

class FormSubmissionFailure extends UpdatePatientState {
  final String errorMessage;

  FormSubmissionFailure(this.errorMessage);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormSubmissionFailure &&
          runtimeType == other.runtimeType &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => errorMessage.hashCode;

  @override
  String toString() {
    return 'FormSubmissionFailure{errorMessage: $errorMessage}';
  }
}
