import 'package:equatable/equatable.dart';

abstract class PatientEvent extends Equatable {}

class FetchPatientData extends PatientEvent {
  FetchPatientData();

  @override
  List<Object?> get props => [];
}

class FetchPatientAllergies extends PatientEvent {
  @override
  List<Object?> get props => [];
}

class SendPatientData extends PatientEvent {
  final String url;
  //final Patient patient;
  SendPatientData({
    required this.url,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
