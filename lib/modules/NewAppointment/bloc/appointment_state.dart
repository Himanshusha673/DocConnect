part of 'appointment_bloc.dart';

class AppointmentState {
  DropDownItem? speciality;
  int range;
  DateTime? appointmentDate;
  bool isEmergency;
  DropDownItem? doctorGender;
  List<AvailableDoctor>? doctors;
  FormSubmissionStatus formStatus;

  List<DropDownItem> genderOptions = const [
    DropDownItem(name: 'Male'),
    DropDownItem(name: 'Female'),
  ];
  List<DropDownItem> specialityOptions = const [
    DropDownItem(name: 'Urologist', iconData: Icons.airline_seat_flat_rounded),
    DropDownItem(name: 'Dermatolist', iconData: Icons.monitor_heart),
    DropDownItem(name: 'Ent', iconData: Icons.hearing),
    DropDownItem(
      name: 'Nephrology',
      iconData: Icons.connect_without_contact,
    ),
  ];

  AppointmentState({
    this.speciality = const DropDownItem(name: 'Urologist', iconData: Icons.airline_seat_flat_rounded),
    this.range = 4,
    this.doctorGender = const DropDownItem(name: 'Male'),
    this.isEmergency = false,
    this.appointmentDate,
    this.doctors,
    this.formStatus = const InitialFormStatus(),
  });

  @override
  List<Object> get props => [];

  AppointmentState copyWith({
    DropDownItem? speciality,
    int? range,
    DateTime? appointmentDate,
    bool? isEmergency,
    DropDownItem? doctorGender,
    List<AvailableDoctor>? doctors,
    FormSubmissionStatus? formStatus,
  }) {
    return AppointmentState(
      speciality: speciality ?? this.speciality,
      range: range ?? this.range,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      isEmergency: isEmergency ?? this.isEmergency,
      doctorGender: doctorGender ?? this.doctorGender,
      doctors: doctors ?? this.doctors,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

class AppointmentLoading extends AppointmentState {}

class AppointmentShowAvailableDoctors extends AppointmentState {
  AppointmentShowAvailableDoctors();
}

class AppointmentDoctorSlotEmpty extends AppointmentState {}

class AppointmentDoctorCheckAvailabilityState extends AppointmentState {
  final List<SlotDatum> slotList;
  final Doctor doctor;
  AppointmentDoctorCheckAvailabilityState({
    required this.slotList,
    required this.doctor,
  });
}

class AppointmentDoctorCheckAvailabilityLoadingState extends AppointmentState {
  AppointmentDoctorCheckAvailabilityLoadingState();
}

class AppointmentErrorState extends AppointmentState {
  String error;
  AppointmentErrorState({required this.error});
}
