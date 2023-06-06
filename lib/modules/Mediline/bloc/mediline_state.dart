part of 'mediline_bloc.dart';

class MedilineState {
  DateTime? selectedDate;
  List<AppointmentDetail>? appointmentList;
  List<Clinic>? clinicList;
  MedilineState({this.selectedDate, this.appointmentList, this.clinicList});
  MedilineState copyWith({
    DateTime? selectedDate,
    List<AppointmentDetail>? appointmentList,
    List<Clinic>? clinicList,
  }) {
    return MedilineState(
      selectedDate: selectedDate ?? this.selectedDate,
      appointmentList: appointmentList ?? this.appointmentList,
      clinicList: clinicList ?? this.clinicList,
    );
  }
}

class MedilineLoadingState extends MedilineState {}
