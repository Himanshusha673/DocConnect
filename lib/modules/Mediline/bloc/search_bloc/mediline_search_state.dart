part of 'mediline_search_bloc.dart';

class MedilineSearchState {
  DateTime? selectedDate;
  List<Clinic>? clinicList;
  MedilineSearchState({this.selectedDate, this.clinicList});
  MedilineSearchState copyWith({
    DateTime? selectedDate,
    List<Clinic>? clinicList,
  }) {
    return MedilineSearchState(
      selectedDate: selectedDate ?? this.selectedDate,
      clinicList: clinicList ?? this.clinicList,
    );
  }
}

class MedilineSearchloadingState extends MedilineSearchState {}

class MedilineSearchResultState extends MedilineSearchState {
  @override
  final List<AppointmentDetail> appointmentList;
  MedilineSearchResultState({
    required this.appointmentList,
  });
}
