part of 'get_prescription_bloc_bloc.dart';

abstract class GetPrescriptionBlocEvent extends Equatable {
  const GetPrescriptionBlocEvent();

  @override
  List<Object> get props => [];
}

class GetAllPrescriptionEvent extends GetPrescriptionBlocEvent {}
