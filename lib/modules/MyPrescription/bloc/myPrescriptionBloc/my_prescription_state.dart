part of 'my_prescription_bloc.dart';

abstract class MyPrescriptionState extends Equatable {
  const MyPrescriptionState();

  @override
  List<Object> get props => [];
}

class MyPrescriptionInitial extends MyPrescriptionState {}

class MyPrescriptionBlocloading extends MyPrescriptionState {}

class MyPrescriptionBlocSuccess extends MyPrescriptionState {
  final GetAllPrecriptionResposnse getAllPrescriptions;

  const MyPrescriptionBlocSuccess({required this.getAllPrescriptions});
}

class MyPrescriptionBlocFailure extends MyPrescriptionState {}
