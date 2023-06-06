part of 'appointment_bloc.dart';

abstract class AppointmentEvent extends Equatable {
  const AppointmentEvent();

  @override
  List<Object> get props => [];
}

class SpecialityChangedEvent extends AppointmentEvent {
  final DropDownItem speciality;
  const SpecialityChangedEvent({required this.speciality});

  @override
  List<Object> get props => [];
}

class RangeChangedEvent extends AppointmentEvent {
  final int range;
  const RangeChangedEvent({required this.range});

  @override
  List<Object> get props => [];
}

class IsEmergencyChangedEvent extends AppointmentEvent {
  final bool isEmergency;
  const IsEmergencyChangedEvent({required this.isEmergency});

  @override
  List<Object> get props => [];
}

class AppointmentDateChangedEvent extends AppointmentEvent {
  final DateTime dateTime;
  const AppointmentDateChangedEvent({required this.dateTime});

  @override
  List<Object> get props => [];
}

class DoctorGenderChangedEvent extends AppointmentEvent {
  final DropDownItem gender;
  const DoctorGenderChangedEvent({required this.gender});

  @override
  List<Object> get props => [];
}

class ShowAvailableDoctorsEvent extends AppointmentEvent {
  const ShowAvailableDoctorsEvent();

  @override
  List<Object> get props => [];
}

class GetDoctorSlots extends AppointmentEvent {
  final Doctor doctor;
  const GetDoctorSlots({required this.doctor});

  @override
  List<Object> get props => [];
}
