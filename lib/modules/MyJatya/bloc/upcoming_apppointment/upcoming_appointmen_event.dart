part of 'upcoming_appointmen_bloc.dart';

abstract class UpcomingAppointmenEvent extends Equatable {
  const UpcomingAppointmenEvent();

  @override
  List<Object> get props => [];
}

class GetUpcomingApppointmentEvent extends UpcomingAppointmenEvent {}

class ReinitializeUpcomingApppointmentEvent extends UpcomingAppointmenEvent {}

class CancelUpcomingAppointmentEvent extends UpcomingAppointmenEvent {
  final String appointmentId;

  const CancelUpcomingAppointmentEvent({required this.appointmentId});
}
