part of 'vaccinations_bloc.dart';

abstract class VaccinationsEvent extends Equatable {
  const VaccinationsEvent();
  @override
  List<Object> get props => [];
}

class VaccinationsGetVaccineListEvent extends VaccinationsEvent {
  const VaccinationsGetVaccineListEvent();
}

class VaccinationsNameChangedEvent extends VaccinationsEvent {
  final DropDownItem vaccineName;
  const VaccinationsNameChangedEvent({required this.vaccineName});
}

class VaccinationsDateChangedEvent extends VaccinationsEvent {
  final String date;
  const VaccinationsDateChangedEvent({required this.date});
}

class VaccinationsImageChangedEvent extends VaccinationsEvent {
  final File image;
  const VaccinationsImageChangedEvent({required this.image});
}

class VaccinationsAddVaccinationDetailEvent extends VaccinationsEvent {
  final Vaccine vaccine;
  const VaccinationsAddVaccinationDetailEvent({required this.vaccine});
}

class VaccinationReInitializeEvent extends VaccinationsEvent {
  const VaccinationReInitializeEvent();
}
