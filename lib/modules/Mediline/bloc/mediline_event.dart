part of 'mediline_bloc.dart';

abstract class MedilineEvent extends Equatable {
  const MedilineEvent();
  @override
  List<Object> get props => [];
}

class MedilineGetAllAppointmetns extends MedilineEvent {
  const MedilineGetAllAppointmetns();
}

class MedilineGetAllClinics extends MedilineEvent {
  const MedilineGetAllClinics();
}

class MedilineSelectedDateChangedEvent extends MedilineEvent {
  const MedilineSelectedDateChangedEvent();
}

class MedilineGetAppointemtnListEvent extends MedilineEvent {
  const MedilineGetAppointemtnListEvent();
}

class MedilineEmptyAppointmentListEvent extends MedilineEvent {
  const MedilineEmptyAppointmentListEvent();
}

class MedilineFailedGetAppointListEvent extends MedilineEvent {
  const MedilineFailedGetAppointListEvent();
}
