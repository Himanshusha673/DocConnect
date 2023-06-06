part of 'get_prescription_bloc_bloc.dart';

abstract class GetPrescriptionBlocState extends Equatable {
  const GetPrescriptionBlocState();

  @override
  List<Object> get props => [];
}

class GetPrescriptionBlocInitial extends GetPrescriptionBlocState {}

class GetPrescriptionBlocloading extends GetPrescriptionBlocState {}

class GetPrescriptionBlocSuccess extends GetPrescriptionBlocState {
  final GetAllPrecriptionResposnse getAllPrescriptions;

  const GetPrescriptionBlocSuccess({required this.getAllPrescriptions});
}

class GetPrescriptionBlocFailure extends GetPrescriptionBlocState {}
