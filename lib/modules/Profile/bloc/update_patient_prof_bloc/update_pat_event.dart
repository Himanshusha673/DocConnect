import 'package:equatable/equatable.dart';
import 'package:doc_connect/modules/Profile/models/allergies/update_allergy.dart';
import 'package:doc_connect/modules/Profile/models/update_user_model.dart';

abstract class PatientUpdateEvent extends Equatable {
  const PatientUpdateEvent();

  @override
  List<Object> get props => [];
}

class PatientUpdateFormSubmitted extends PatientUpdateEvent {
  final UpdateUserModel form;
  final AllergyUpdateRequest allergyUpdateRequest;
  final String allergyId;

  const PatientUpdateFormSubmitted(
      {required this.form,
      required this.allergyUpdateRequest,
      required this.allergyId});

  @override
  List<Object> get props => [form];
}
