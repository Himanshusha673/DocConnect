part of 'my_prescription_bloc.dart';

abstract class MyPrescriptionEvent extends Equatable {
  const MyPrescriptionEvent();

  @override
  List<Object> get props => [];
}

class GetAllMyPrescriptionEvent extends MyPrescriptionEvent {}
