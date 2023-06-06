part of 'prescription_details_bloc.dart';

abstract class PrescriptionDetailsBlocEvent extends Equatable {
  const PrescriptionDetailsBlocEvent();

  @override
  List<Object> get props => [];
}

class GetPrescriptionDetailsEvent extends PrescriptionDetailsBlocEvent {
  final String appointmentID;
  const GetPrescriptionDetailsEvent({required this.appointmentID});
}

class DownloadPrescriptionDetailsEvent extends PrescriptionDetailsBlocEvent {
  final String prescriptionId;
  const DownloadPrescriptionDetailsEvent({required this.prescriptionId});
}
