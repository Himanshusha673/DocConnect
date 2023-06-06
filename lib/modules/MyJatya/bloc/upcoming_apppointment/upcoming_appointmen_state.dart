part of 'upcoming_appointmen_bloc.dart';

abstract class UpcomingAppointmenState extends Equatable {
  const UpcomingAppointmenState();

  @override
  List<Object> get props => [];
}

abstract class AppointmentActionState extends UpcomingAppointmenState {}

class UpcomingAppointmenInitial extends UpcomingAppointmenState {}

class UpcomingAppointmenloading extends UpcomingAppointmenState {}

class UpcomingAppointmenSuccess extends UpcomingAppointmenState {
  final GetAllAppointmentsResponse getAllAppointments;

  const UpcomingAppointmenSuccess({required this.getAllAppointments});
}

class UpcomingAppointmeFailure extends UpcomingAppointmenState {
  final String err;

  const UpcomingAppointmeFailure({required this.err});
}

class CancelAppointAndNavigatePop extends AppointmentActionState {}

class CancelAppointmentFailure extends AppointmentActionState {}
